% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/init.R
\name{proxy}
\alias{proxy}
\title{Start a new proxy}
\usage{
proxy(ipAddress = "http://localhost", bmpPort, port, openPort = TRUE)
}
\arguments{
\item{ipAddress}{ip address of BrowserMob Proxy standalone}

\item{bmpPort}{port BrowserMob Proxy is listening on}

\item{port}{port you wish to use for proxy traffic}

\item{openPort}{call the openPort function to create a new proxy on the
BMP server.}
}
\value{
an object of type proxy is returned.
}
\description{
Start a new proxy
}
\examples{
\dontrun{
 # A BMP server is assummed running on port 9090
 prxy <- proxy(bmpPort = 9090L, port = 39500L)
}
}

