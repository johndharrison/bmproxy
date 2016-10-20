
#' @rdname getWhiteList
getWhiteList <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getWhiteList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['getWhiteList']][['method']],
       url = appURL)
}



#' @rdname setWhiteList
setWhiteList <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setWhiteList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['setWhiteList']][['method']],
       url = appURL)
}



#' @rdname getBlackList
getBlackList <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['getBlackList']][['method']],
       url = appURL)
}



#' @rdname addURLBlackList
addURLBlackList <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['addURLBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['addURLBlackList']][['method']],
       url = appURL)
}



#' @rdname clearBlackList
clearBlackList <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['clearBlackList']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['clearBlackList']][['method']],
       url = appURL)
}



