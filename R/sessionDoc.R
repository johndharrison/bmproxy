#' Open a new port/proxy
#'
#' opens a new port on the Browser Mob Proxy server
#' This function is usually called via \code{\link{proxy}}
#'
#' @template proxy
#' @template ellipsis
#' @family session functions
#' @export
#'
#' @example /inst/examples/docs/session.R
#' @name openPort
NULL


#' Get ports/proxies
#'
#' returns the ports that are currently open on the Browser Mob Proxy 
#'    server.
#'
#' @template proxy
#' @template ellipsis
#' @family session functions
#' @export
#' 
#' @return Returns a list of ports. Each port is a \code{\link{proxy}}
#'    object
#'
#' @example /inst/examples/docs/session.R
#' @name getPorts
NULL


#' Close a port/proxy
#'
#' Closes the port associated with the proxy object
#'
#' @template proxy
#' @template ellipsis
#' @family session functions
#' @export
#'
#' @template retProxy
#' @example /inst/examples/docs/session.R
#' @name closeProxy
NULL


#' Wait for traffic to stop
#'
#' Waits for the network to be quiet
#'
#' @template proxy
#' @param quietPeriod number of milliseconds the network needs to be quiet 
#'    for
#' @param timeOut max number of milliseconds to wait
#' @template ellipsis
#' @family session functions
#' @export
#'
#' @template retProxy
#' @example /inst/examples/docs/session.R
#' @name waitForTraffic
NULL


#' timeouts
#'
#'timeouts
#'
#' @template proxy
#' @template ellipsis
#' @param requestTimeout Request timeout in milliseconds. A timeout value 
#'    of -1 is interpreted as infinite timeout. Optional, default to -1 
#' @param readTimeout ead timeout in milliseconds. Which is the timeout 
#'    for waiting for data or, put differently, a maximum period 
#'    inactivity between two consecutive data packets). A timeout value of 
#'    zero is interpreted as an infinite timeout. Optional, default to 
#'    60000.
#' @param connectionTimeout Determines the timeout in milliseconds until a 
#'    connection is established. A timeout value of zero is interpreted as 
#'    an infinite timeout. Optional, default to 60000.
#' @param dnsCacheTimeout Sets the maximum length of time that records 
#'    will be stored in this Cache. A nonpositive value disables this 
#'    feature (that is, sets no limit). Optional, default to "0".
#' @family session functions
#' @template retProxy
#' @export
#'
#' @example /inst/examples/docs/session.R
#' @name timeouts
NULL


#' Set the retry count
#'
#' Set the retry count
#'
#' @template proxy
#' @param retryCount  The number of times a method will be retried
#' @template ellipsis
#' @family session functions
#' @export
#'
#' @template retProxy
#' @example /inst/examples/docs/session.R
#' @name setRetry
NULL


#' Empty the DNS
#'
#' Empties the DNS cache. Clears the DNS cache associated with the proxy instance
#'
#' @template proxy
#' @template ellipsis
#' @family session functions
#' @export
#'
#' @template retProxy
#' @example /inst/examples/docs/session.R
#' @name emptyDNS
NULL



