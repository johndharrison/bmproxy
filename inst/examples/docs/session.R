\dontrun{
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  # get ports with running proxies
  prxy %>% getPorts
  # set timeouts
  prxy %>% timeouts(requestTimeout = 50000L, readTimeout = 50000L,
                    connectionTimeout = 50000L)
  # close proxy and check ports
  prxy %>% 
    closeProxy %>% 
    getPorts
}
