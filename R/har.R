
#' @rdname createHAR
createHAR <- function(proxy, ref = NULL,  title = ref, 
                      captureHeaders = FALSE, captureContent = FALSE,
                      captureBinaryContent = FALSE, ...){
  assert_proxy(proxy)
  assert_string_or_null(ref)
  assert_string_or_null(title)
  assert_that(is.logical(captureHeaders))
  assert_that(is.logical(captureContent))
  assert_that(is.logical(captureBinaryContent))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['createHAR']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  body <- list()
  body$initialPageRef <- ref
  body$initialPageTitle <- title
  body$captureHeaders <- captureHeaders
  body$captureContent <- captureContent
  body$captureBinaryContent <- captureBinaryContent
  res <- VERB(verb = bmpAPI[['createHAR']][['method']],
              url = appURL,
              body = body,
              encode = "form"
  )
  stop_for_status(res, paste("create har returned response: ", 
                             res$status)
  )
  if(identical(res$status_code, 200L)){
    return(list(status = 200L, har = content(res)))
  }
  if(identical(res$status_code, 204L)){
    return(list(status = 204L, har = NULL))
  }
}



#' @rdname newPage
newPage <- function(proxy, ref = NULL,  title = ref, ...){
  assert_proxy(proxy)
  assert_string_or_null(ref)
  assert_string_or_null(title)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['newPage']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  body <- list()
  body$pageRef <- ref
  body$pageTitle <- title
  res <- VERB(verb = bmpAPI[['newPage']][['method']],
              url = appURL,
              body = body,
              encode = "form"
  )
  stop_for_status(res, paste("new page returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname getHAR
getHAR <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getHAR']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['getHAR']][['method']],
              url = appURL)
  stop_for_status(res, paste("get har returned response: ", 
                             res$status)
  )
  content(res)
}



