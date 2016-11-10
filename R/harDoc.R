#' Create HAR
#'
#' Creates a new HAR attached to the proxy and returns the HAR content if 
#'    there was a previous HAR.
#'
#' @template proxy
#' @param ref The string name of The first page ref that should be used in 
#'    the HAR. Optional if NULL defaults to "Page 1".
#' @param title The title of first HAR page. Optional, default to ref
#' @param captureHeaders Boolean, capture headers or not. Optional, 
#'    default to FALSE.
#' @param captureContent Boolean, capture content bodies or not. Optional,
#'    default to FALSE.
#' @param captureBinaryContent Boolean, capture binary content or not. 
#'    Optional, default to FALSE.
#' @param captureCookies Boolean, capture cookies or not. 
#'    Optional, default to FALSE.
#' @template ellipsis
#' @family har functions
#' @export
#' @return Returns a list with the response status code and har content.
#'    Returns status 204 when creating a har with a particular name the 
#'    first time and har = NULL. Returns 200 and the previous har when 
#'    creating one with the same name 
#'
#' @example /inst/examples/docs/har.R
#' @name createHAR
NULL


#' Create new page
#'
#' Starts a new page on the existing HAR.
#'
#' @template proxy
#' @param ref The string name of the first page ref that should be used in 
#'    the HAR. Optional, default to "Page N" where N is the next page 
#'    number (zero indexed so 1st page is page 0).
#' @param title The title of new HAR page. Optional, default to ref.
#' @template ellipsis
#' @family har functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/har.R
#' @name newPage
NULL


#' Get HAR
#'
#' Returns the JSON/HAR content representing all the HTTP traffic passed 
#'    through the proxy (provided you have already created the HAR with 
#'    \code{\link{createHAR}})
#'
#' @template proxy
#' @template ellipsis
#' @family har functions
#' @export
#' @return Returns the HAR as parsed JSON content
#'
#' @example /inst/examples/docs/har.R
#' @name getHAR
NULL



