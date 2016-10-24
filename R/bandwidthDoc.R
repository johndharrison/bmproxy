#' Limit Bandwidth
#'
#' Limit the bandwidth through the proxy on the port associated with 
#'    proxy argument.
#'
#' @template proxy
#' @param downK Sets the downstream bandwidth limit in kbps. Optional if 
#'    NULL (default) unlimited. From the perspective of the server.
#' @param upK Sets the upstream bandwidth limit kbps. Optional if 
#'    NULL (default) unlimited. From the perspective of the server.
#' @param downMaxK Specifies how many kilobytes in total the client is 
#'    allowed to download through the proxy. Optional if NULL (default) 
#'    unlimited. From the perspective of the server.
#' @param upMaxK Specifies how many kilobytes in total the client is 
#'    allowed to upload through the proxy. Optional if NULL (default) 
#'    unlimited. From the perspective of the server.
#' @param latency Add the given latency to each HTTP request. Optional, by 
#'    default all requests are invoked without latency.
#' @template ellipsis
#' @family bandwidth functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/bandwidth.R
#' @name limitBandwidth
NULL


#' Get bandwidth remaining
#'
#' Displays the amount of data remaining to be uploaded/downloaded until 
#'    the limit is reached
#'
#' @template proxy
#' @template ellipsis
#' @family bandwidth functions
#' @export
#' @return A data.frame detailing the maximum bandwidth and remaining
#'    bandwidth upstream and downstream is returned.
#'
#' @example /inst/examples/docs/bandwidth.R
#' @name getBWremaining
NULL



