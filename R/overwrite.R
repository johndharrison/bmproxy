
#' @rdname setHeaders
setHeaders <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setHeaders']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['setHeaders']][['method']],
       url = appURL)
}



#' @rdname remapHosts
remapHosts <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['remapHosts']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['remapHosts']][['method']],
       url = appURL)
}



#' @rdname setAutoBAuth
setAutoBAuth <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setAutoBAuth']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['setAutoBAuth']][['method']],
       url = appURL)
}



#' @rdname rewriteURL
rewriteURL <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['rewriteURL']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['rewriteURL']][['method']],
       url = appURL)
}



#' @rdname removeRewrites
removeRewrites <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['removeRewrites']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['removeRewrites']][['method']],
       url = appURL)
}



