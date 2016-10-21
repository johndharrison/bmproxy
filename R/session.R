
#' @rdname openPort
openPort <- function(proxy, ...){
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['openPort']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  chk <- tryCatch(
    {
      VERB(verb = bmpAPI[['openPort']][['method']],
           url = appURL, body = list(port = as.character(proxy$port)),
           encode = "form"
      )
    }, 
    error = function(e){
      if(identical(e$message, "Couldn't connect to server")){
        message("Tried to open proxy calling: ", proxy$url)
        stop(e$message, ": is a BMP server running?", call. = FALSE)
      }
    }
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
  res <- VERB(verb = bmpAPI[['closeProxy']][['method']],
              url = appURL)
  invisible(proxy)
}



#' @rdname waitForTraffic
waitForTraffic <- function(proxy, quietPeriod = NULL, timeOut = NULL, ...){
  assert_that(is.integer(quietPeriod))
  assert_that(is.integer(timeOut))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['waitForTraffic']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['waitForTraffic']][['method']],
              url = appURL, 
              body = list(quietPeriodInMs = quietPeriod,
                          timeoutInMs = timeOut),
              encode = "form"
  )
  stop_for_status(res, c("wait for traffic returned response: ", 
                         res$status)
  )
  invisible(proxy)
}



#' @rdname timeouts
timeouts <- function(proxy, requestTimeout = -1L, readTimeout = 60000L,
                     connectionTimeout = 60000L, dnsCacheTimeout = 0L, 
                     ...){
  assert_that(is.integer(requestTimeout))
  assert_that(is.integer(readTimeout))
  assert_that(is.integer(connectionTimeout))
  assert_that(is.integer(dnsCacheTimeout))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['timeouts']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- 
    VERB(verb = bmpAPI[['timeouts']][['method']],
         url = appURL,
         body = list(requestTimeout = as.character(requestTimeout),
                     readTimeout = as.character(readTimeout),
                     connectionTimeout = as.character(connectionTimeout),
                     dnsCacheTimeout = as.character(dnsCacheTimeout))
    )
  stop_for_status(res, c("timeouts returned response: ", 
                         res$status)
  )
  invisible(proxy)
  
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



