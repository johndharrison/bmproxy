#' Set httr proxy configuration 
#' 
#' Sets the proxy configuration for use with \code{\link{httr}}
#'
#' @template proxy
#' @param cert_file An SSL certification file. If NULL bmproxy will use
#'    the  certificate file bundled with BrowserMob Proxy. For details
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
  config(cainfo = cert_file, proxy = proxy$baseip, proxyport = proxy$port)
}


#' Set Selenium proxy configuration
#'
#' Sets the proxy configuration for use with Selenium
#'
#' @template proxy 
#' @param eCaps A list of existing extra capabilities. 
#' @param browser The browser type to set the config for. Can use firefox 
#'    or chrome. The default is firefox. If left NULL firefox default is 
#'    used.
#'
#' @return Returns an extra capabilities list that can be passed to 
#'    Selenium
#' @return bmpIPaddress Stipulate an alternative BMP ip address. The
#'    Selenium server may for example be running in a docker container
#'    as may the BMP server. Defaults to NULL and the ip address implied
#'    by proxy is used
#' @export
#'
#' @examples
#' \dontrun{
#'   prxy <- proxy(bmpPort = 9090L, port = 39500L)
#'   eCap <- sel_proxy(prxy, browser = "chrome")
#' }

sel_proxy <- function(proxy, eCaps = NULL, 
                      browser = c("firefox", "chrome"), 
                      bmpIPaddress = NULL){
  assert_proxy(proxy)
  assert_list_or_null(eCaps)
  assert_string_or_null(bmpIPaddress)
  browser <- match.arg(browser)
  newCaps <- if(identical(browser, "chrome")){
    list(chromeOptions = 
           list(args =
                  c(eCaps[["chromeOptions"]][["args"]], 
                    list(
                      paste("--proxy-server",  
                            paste(ifelse(is.null(bmpIPaddress), 
                                         proxy$baseip, bmpIPaddress), 
                                  proxy$port, sep = ":"),
                            sep = "="
                      ), 
                      "--disable-web-security"
                    )
                  )
           )
    )
  }else{
    list(proxy = 
           list(proxyType = 'manual', 
                httpProxy = paste(ifelse(is.null(bmpIPaddress), 
                                         proxy$baseip, bmpIPaddress), 
                                  proxy$port, sep = ":")
           )
    )
  }
  c(eCaps, newCaps)
}
