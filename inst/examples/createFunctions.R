# utility script to generate the package functions
DOCUMENT <- TRUE

library(bmproxy)
library(whisker)
library(data.table)
bmpAPI <- bmproxy:::bmpAPI

roxy <- "#' {{command}}
#'
#'{{command}}
#'
#' @template proxy
#' @template ellipsis
#' @family {{group}} functions
#' @export
#'
#' @example /inst/examples/docs/{{group}}.R
#' @name {{command}}
NULL


"

fbody <- "
#' @rdname {{command}}
{{command}} <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['{{command}}']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['{{command}}']][['method']],
       url = appURL)
}


"

bmpFuncs <- lapply(names(bmpAPI), function(x){
  appData <- data.frame(command = x, bmpAPI[[x]])
  appData$fbody <- whisker.render(fbody, appData)
  appData$roxy <- whisker.render(roxy, appData)
  appData
})

bmpFuncs <- setDT(rbindlist(bmpFuncs))

bmpFuncs[,write(file = paste0("R/", group, ".R"),
                 paste(fbody, collapse = "")),
          by = group]

# add documentation
if(DOCUMENT){
  bmpFuncs[,write(file = paste0("R/", group, "Doc.R"),
                   paste(roxy, collapse = "")),
            by = group]
}
