#' Set httr proxy configuration 
#' 
#' Sets the proxy configuration for use with \code{\link{httr}}
#'
#' @template proxy
#' @param cert_file An SSL certification file. If NULL bmproxy will use
#'    the  certificate file bundled with Browser Mob Proxy. For details
#'    see https://github.com/lightbody/browsermob-proxy/blob/master/mitm/README.md
#'
#' @return Returns a \code{\link{httr}} config object see 
#'    \code{\link{config}}. This config contains the url and port of the 
#'    proxy together with the appropriate certificate file.
#' @export
#'
#' @examples
#' \dontrun{
#'   prxy <- proxy(bmpPort = 9090L, port = 39500L)
#'   # create a HAR
#'   prxy %>% createHAR(ref = "httr_traffic")
#'   rproj <- GET("https://www.r-project.org/", httr_proxy(prxy))
#'   httr_har <- prxy %>% getHAR()
#'   httr_har[["log"]][["entries"]][[1]]["request"]
#'   httr_har[["log"]][["entries"]][[1]]["response"]
#'   prxy %>% closeProxy
#' }

httr_proxy <- function(proxy, cert_file = NULL){
  assert_proxy(proxy)
  assert_string_or_null(cert_file)
  cert_file <- 
    ifelse(is.null(cert_file),
           file.path(system.file("certificates", package = "bmproxy"),
                     "ca-certificate-rsa.cer"),
           cert_file
    )
  config(cainfo = cert_file, proxy = prxy$baseip, proxyport = prxy$port)
}
