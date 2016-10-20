
#' @rdname createHAR
createHAR <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['createHAR']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['createHAR']][['method']],
       url = appURL)
}



#' @rdname newPage
newPage <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['newPage']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['newPage']][['method']],
       url = appURL)
}



#' @rdname getHAR
getHAR <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getHAR']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['getHAR']][['method']],
       url = appURL)
}



