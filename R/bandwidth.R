
#' @rdname limitBandwidth
limitBandwidth <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['limitBandwidth']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['limitBandwidth']][['method']],
       url = appURL)
}



#' @rdname getBWremaining
getBWremaining <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getBWremaining']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  VERB(verb = bmpAPI[['getBWremaining']][['method']],
       url = appURL)
}



