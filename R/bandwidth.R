
#' @rdname limitBandwidth
limitBandwidth <- function(proxy, downK = NULL, upK = NULL, 
                           downMaxK = NULL, upMaxK = NULL, latency = NULL,
                           ...){
  assert_proxy(proxy)
  assert_integer_or_null(downK)
  assert_integer_or_null(upK)
  assert_integer_or_null(downMaxK)
  assert_integer_or_null(upMaxK)
  assert_integer_or_null(latency)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['limitBandwidth']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  body <- list()
  body$downstreamKbps <- downK
  body$upstreamKbps <- upK
  body$downstreamMaxKB <- downMaxK
  body$upstreamMaxKB <- upMaxK
  body$latency <- latency

  res <- VERB(verb = bmpAPI[['limitBandwidth']][['method']],
              url = appURL,
              body = body,
              encode = "form"
  )
  stop_for_status(res, paste("limit bandwidth returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname getBWremaining
getBWremaining <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['getBWremaining']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['getBWremaining']][['method']],
              url = appURL)
  stop_for_status(res, paste("get bandwidth remaining returned response: ", 
                             res$status)
  )
  data.frame(content(res), stringsAsFactors = FALSE)
}



