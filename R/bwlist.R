
#' @rdname getWhiteList
getWhiteList <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getWhiteList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['getWhiteList']][['method']],
              url = appURL
  )
  stop_for_status(res, paste("get white list returned response: ", 
                             res$status)
  )
  content(res)
}



#' @rdname setWhiteList
setWhiteList <- function(proxy, regex, statusCode, ...){
  assert_proxy(proxy)
  assert_that(is.character(regex))
  assert_that(is.integer(statusCode))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setWhiteList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['setWhiteList']][['method']],
              url = appURL,
              body = list(regex = paste(regex, collapse = ","), 
                          status = statusCode),
              encode = "form"
  )
  stop_for_status(res, paste("set white list returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname clearWhiteList
clearWhiteList <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['clearWhiteList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['clearWhiteList']][['method']],
              url = appURL)
  stop_for_status(res, paste("clear white list returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname getBlackList
getBlackList <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['getBlackList']][['method']],
              url = appURL)
  stop_for_status(res, paste("get black list returned response: ", 
                             res$status)
  )
  blackList <- content(res)
  blackList <- lapply(blackList, function(x){
    lapply(x, function(y) if(is.null(y)){NA}else{y})
  }
  )
  do.call(rbind.data.frame, c(blackList, stringsAsFactors = FALSE))
}



#' @rdname addURLBlackList
addURLBlackList <- function(proxy, regex, statusCode, method = NULL, ...){
  assert_proxy(proxy)
  assert_that(is_string(regex))
  assert_that(is.integer(statusCode))
  assert_string_or_null(method)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['addURLBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  body <- list(regex = regex, status = statusCode)
  body$method <- method
  res <- VERB(verb = bmpAPI[['addURLBlackList']][['method']],
              url = appURL,
              body = body,
              encode = "form"
  )
  stop_for_status(res, paste("add URL black list returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname clearBlackList
clearBlackList <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['clearBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['clearBlackList']][['method']],
              url = appURL)
  stop_for_status(res, paste("clear black list returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



