#' Get white list
#'
#' Gets a list of URL patterns from the whitelist
#'
#' @template proxy
#' @template ellipsis
#' @family bwlist functions
#' @export
#' @return Returns a list. Each item of the list is a regex from the 
#'    white list
#'
#' @example /inst/examples/docs/bwlist.R
#' @name getWhiteList
NULL


#' Set white list
#'
#' Sets a list of URL patterns to whitelist
#'
#' @template proxy
#' @param regex a character vector of regular expressions
#' @param statusCode the HTTP status code to return for URLs that do not 
#'    match the whitelist
#' @template ellipsis
#' @family bwlist functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/bwlist.R
#' @name setWhiteList
NULL


#' clearWhiteList
#'
#'clearWhiteList
#'
#' @template proxy
#' @template ellipsis
#' @family bwlist functions
#' @export
#'
#' @example /inst/examples/docs/bwlist.R
#' @name clearWhiteList
NULL


#' Get BlackList
#'
#' Gets the URL's in the Black List. Returns a data.frame
#'
#' @template proxy
#' @template ellipsis
#' @family bwlist functions
#' @export
#' @return Returns a data.frame of black listed urls
#'
#' @example /inst/examples/docs/bwlist.R
#' @name getBlackList
NULL


#' Set a URL to blacklist
#'
#' Sets a URL to blacklist
#'
#' @template proxy
#' @param regex The blacklist regular expression.
#' @param statusCode The HTTP status code to return for URLs that are 
#'    blacklisted.
#' @param method The regular expression for matching HTTP method 
#'    (GET, POST, PUT, etc). Optional, by default processing all HTTP 
#'    method.
#' @template ellipsis
#' @family bwlist functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/bwlist.R
#' @name addURLBlackList
NULL


#' Clear Black List
#'
#' Clears the black list of URL's
#'
#' @template proxy
#' @template ellipsis
#' @family bwlist functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/bwlist.R
#' @name clearBlackList
NULL



