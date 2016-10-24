\dontrun{
  library(httr)
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  tmp <- tempfile(fileext = ".dat")
  prxy %>% createHAR(ref = "httr_download_1")
  
  # http://ping.online.net/1Mo.dat a 1mb test file
  # limit bandwidth to 50kps
  prxy %>% limitBandwidth(upK = 200L)
  testDL1 <- GET("http://ping.online.net/1Mo.dat", httr_proxy(prxy), 
               httr::write_disk(tmp, overwrite = TRUE), 
               config(fresh_connect = 1L))
  
  bwDL1 <- prxy %>% getBWremaining()
  # create new page
  prxy %>% newPage(ref = "httr_download_2")
  prxy %>% limitBandwidth(upK = 100L)
  
  # empty the DNS cache
  prxy %>% emptyDNS
  testDL2 <- GET("http://ping.online.net/1Mo.dat", httr_proxy(prxy), 
                httr::write_disk(tmp, overwrite = TRUE), 
                config(fresh_connect = 1L))
  bwDL2 <- prxy %>% getBWremaining()

  testDL1$times["total"]
  testDL2$times["total"]
  
  prxy %>% closeProxy
  
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  tmpFile <- upload_file(tmp)
  
  # create new HAR for uploads
  prxy %>% createHAR(ref = "httr_upload_1")
  prxy %>% limitBandwidth(downK = 50L)
  testUP1 <- POST("http://httpbin.org/post", httr_proxy(prxy), 
                 body = tmpFile, 
                 config(fresh_connect = 1L))
  # create new page
  prxy %>% newPage(ref = "httr_upnload_2")
  prxy %>% limitBandwidth(downK = 25L)
  
  # empty the DNS cache
  prxy %>% emptyDNS
  testUP2 <- POST("http://httpbin.org/post", httr_proxy(prxy), 
                  body = tmpFile, 
                  config(fresh_connect = 1L))
  
  testUP1$times["total"]
  testUP2$times["total"]
  
  prxy %>% closeProxy
}
