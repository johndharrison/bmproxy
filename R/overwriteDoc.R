#' Set headers
#'
#' Set and override HTTP Request headers. This sets the headers that will 
#'    set by the proxy on all requests
#'
#' @template proxy
#' @param headers A named list. The name of an item is the header name 
#'    (such as "User-Agent") and value is a value of HTTP header to setup 
#'    (such as "BrowserMob-Agent"). 
#'    Example: list("User-Agent" = "BrowserMob-Agent")
#' @template ellipsis
#' @family overwrite functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/overwrite.R
#' @name setHeaders
NULL


#' Remap hosts
#'
#' Remap the hosts for a specific URL. Option to add a list of address
#'    remaps via hostMap argument.
#'
#' @template proxy
#' @param address
#' @param ipAddress
#' @param hostMap An optional named list of address/ipAddress items.
#' @template ellipsis
#' @family overwrite functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/overwrite.R
#' @name remapHosts
NULL


#' Set basic authentication
#'
#' Adds automatic basic authentication to a domain
#'
#' @template proxy
#' @param domain domain to set authentication credentials for
#' @param username valid username to use when authenticating
#' @param password valid password to use when authenticating
#' @template ellipsis
#' @family overwrite functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/overwrite.R
#' @name setAutoBAuth
NULL


#' Rewrite URL
#'
#' Rewrites the requested url.
#'
#' @template proxy
#' @param match a regex to match requests with
#' @param replace a string to replace the matches with
#' @template ellipsis
#' @family overwrite functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/overwrite.R
#' @name rewriteURL
NULL


#' Remove redirection rules
#'
#' Removes all URL redirection rules currently in effect
#'
#' @template proxy
#' @template ellipsis
#' @family overwrite functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/overwrite.R
#' @name removeRewrites
NULL



