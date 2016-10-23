
#' @rdname reqInterceptor
reqInterceptor <- function(proxy, jsFilter, ...){
  assert_proxy(proxy)
  assert_that(is_string(jsFilter))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['reqInterceptor']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['reqInterceptor']][['method']],
              url = appURL, 
              body = jsFilter,
              content_type_json()
  )
  stop_for_status(res, paste("request interceptor returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname resInterceptor
resInterceptor <- function(proxy, jsFilter, ...){
  assert_proxy(proxy)
  assert_that(is_string(jsFilter))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['resInterceptor']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['resInterceptor']][['method']],
              url = appURL, 
              body = jsFilter,
              content_type_json()
  )
  stop_for_status(res, paste("response interceptor returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



