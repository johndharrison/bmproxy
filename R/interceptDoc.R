#' Intercept request
#'
#' Executes the javascript against each request
#'
#' @template proxy
#' @param jsFilter Javascript request filters have access to the variables 
#'    request (type io.netty.handler.codec.http.HttpRequest), contents 
#'    (type net.lightbody.bmp.util.HttpMessageContents), and messageInfo 
#'    (type net.lightbody.bmp.util.HttpMessageInfo). messageInfo contains 
#'    additional information about the message, including whether the 
#'    message is sent over HTTP or HTTPS, as well as the original request 
#'    received from the client before any changes made by previous 
#'    filters. If the javascript returns an object of type 
#'    io.netty.handler.codec.http.HttpResponse, the HTTP request will 
#'    "short-circuit" and return the response immediately
#' @template ellipsis
#' @family intercept functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/intercept.R
#' @name reqInterceptor
NULL


#' Intercept response
#'
#' Executes the javascript against each response
#'
#' @template proxy
#' @param jsFilter Javascript response filters have access to the 
#'    variables response (type io.netty.handler.codec.http.HttpResponse), 
#'    contents (type net.lightbody.bmp.util.HttpMessageContents), and 
#'    messageInfo (type net.lightbody.bmp.util.HttpMessageInfo). As in the 
#'    request filter, messageInfo contains additional information about 
#'    the message.
#' @template ellipsis
#' @family intercept functions
#' @export
#' @template retProxy
#'
#' @example /inst/examples/docs/intercept.R
#' @name resInterceptor
NULL



