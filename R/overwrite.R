
#' @rdname setHeaders
setHeaders <- function(proxy, headers = list(), ...){
  assert_proxy(proxy)
  assert_that(is.list(headers))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setHeaders']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['setHeaders']][['method']],
              url = appURL,
              body = headers,
              encode = "json")
  stop_for_status(res, paste("set headers returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname remapHosts
remapHosts <- function(proxy, address = NULL, ipAddress = NULL,
                       hostMap = list(), ...){
  assert_proxy(proxy)
  assert_string_or_null(address)
  assert_string_or_null(ipAddress)
  assert_that(is.list(hostMap))
  body <- c(list(), hostMap)
  body[address] <- ipAddress
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['remapHosts']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['remapHosts']][['method']],
              url = appURL,
              body = body,
              encode = "json"
  )
  stop_for_status(res, paste("remap hosts returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname setAutoBAuth
setAutoBAuth <- function(proxy, domain, username, password, ...){
  assert_proxy(proxy)
  assert_that(is_string(domain))
  assert_that(is_string(username))
  assert_that(is_string(password))
  wdata <- data.frame(port = proxy$port, 
                      domain = domain, 
                      stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['setAutoBAuth']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['setAutoBAuth']][['method']],
              url = appURL,
              body = list(username = username, password = password),
              encode = "json"
  )
  stop_for_status(res, paste("set basic auth returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname rewriteURL
rewriteURL <- function(proxy, match, replace, ...){
  assert_proxy(proxy)
  assert_that(is_string(match))
  assert_that(is_string(replace))
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['rewriteURL']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['rewriteURL']][['method']],
              url = appURL, 
              body = list(matchRegex = match, replace = replace),
              encode = "form"
  )
  stop_for_status(res, paste("rewrite URL returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



#' @rdname removeRewrites
removeRewrites <- function(proxy, ...){
  assert_proxy(proxy)
  wdata <- data.frame(port = proxy$port, stringsAsFactors = FALSE)
  path <- whisker.render(bmpAPI[['removeRewrites']][['path']], wdata)
  appURL <- file.path(proxy$url, path)
  res <- VERB(verb = bmpAPI[['removeRewrites']][['method']],
              url = appURL)
  stop_for_status(res, paste("rewrite URL returned response: ", 
                             res$status)
  )
  invisible(proxy)
}



