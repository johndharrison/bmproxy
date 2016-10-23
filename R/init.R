#' Start a new proxy
#'
#' @param ipAddress ip address of BrowserMob Proxy standalone
#' @param bmpPort port BrowserMob Proxy is listening on
#' @param port port you wish to use for proxy traffic
#' @param openPort call the openPort function to create a new proxy on the
#'    BMP server.
#'
#' @return an object of type proxy is returned. 
#' @export
#'
#' @examples
#' \dontrun{
#'  # A BMP server is assummed running on port 9090
#'  prxy <- proxy(bmpPort = 9090L, port = 39500L)
#' }

proxy <- function(ipAddress = "http://localhost", bmpPort, port,
                  openPort = TRUE){
  proxy <- list(url = paste(ipAddress, bmpPort, sep = ":"),
                port = port,
                baseip = ipAddress,
                bmpPort = bmpPort)
  class(proxy) <- "proxy"
  if(openPort){openPort(proxy)}
  invisible(proxy)
}

#' @export
print.proxy <- function(x, ...){
  cat("Proxy ip address:", x$url, "\n")
  cat("Proxy listening for traffic on port:", x$port, "\n")
}