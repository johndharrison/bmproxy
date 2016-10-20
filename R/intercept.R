
#' @rdname reqInterceptor
reqInterceptor <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['reqInterceptor']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['reqInterceptor']][['method']],
       url = appURL)
}



#' @rdname resInterceptor
resInterceptor <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['resInterceptor']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['resInterceptor']][['method']],
       url = appURL)
}



