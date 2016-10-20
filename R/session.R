
#' @rdname openPort
openPort <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['openPort']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['openPort']][['method']],
       url = appURL, body = list(port = as.character(proxy$port)),
       encode = "form"
  )
}



#' @rdname getPorts
getPorts <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getPorts']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['getPorts']][['method']],
       url = appURL)
  lapply(content(res)$proxyList, function(x){
    proxy(proxy$baseip, bmpPort = proxy$bmpPort, port = x$port, 
          openPort = FALSE)
  })
}



#' @rdname closeProxy
closeProxy <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['closeProxy']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['closeProxy']][['method']],
       url = appURL)
}



#' @rdname waitForTraffic
waitForTraffic <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['waitForTraffic']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['waitForTraffic']][['method']],
       url = appURL)
}



#' @rdname timeouts
timeouts <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['timeouts']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['timeouts']][['method']],
       url = appURL)
}



#' @rdname setRetry
setRetry <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setRetry']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['setRetry']][['method']],
       url = appURL)
}



#' @rdname emptyDNS
emptyDNS <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['emptyDNS']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['emptyDNS']][['method']],
       url = appURL)
}



