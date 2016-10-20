#' Start a new proxy
#'
#' @param ipAddress ip address of BrowserMob Proxy standalone
#' @param bmpPort port BrowserMob Proxy is listening on
#' @param port port you wish to use for proxy traffic
#'
#' @return an object of type proxy see \code{\link{proxy}}
#' @export
#'
#' @examples

proxy <- function(ipAddress = "http://localhost", bmpPort, port){
  proxy <- list(url = paste(ipAddress, bmpPort, sep = ":"),
                port = port)
  class(proxy) <- "proxy"
  openPort(proxy)
  invisible(proxy)
}

#' Documentation of proxy object
#'
#' doc for proxy
#' @name proxy
#' @examples
#' \dontrun{
#' 
#' }
NULL

proxy.print <- function(x, ...){
  cat("Proxy ip address:", x$url, "\n")
  cat("Proxy listening for traffic on port:", x$port, "\n")
}