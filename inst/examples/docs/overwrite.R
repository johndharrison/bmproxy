\dontrun{
  library(httr)
  library(xml2)
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  prxy %>% createHAR(ref = "httr_traffic_1")
  ua1 <- GET("http://httpbin.org/user-agent", httr_proxy(prxy), 
             user_agent("httr"))
  
  prxy %>% 
    setHeaders(list("User-Agent" = "BrowserMob-Agent")) %>% 
    newPage(ref = "httr_traffic_2")
  ua2 <- GET("http://httpbin.org/user-agent", httr_proxy(prxy), 
             user_agent("httr"))
  
  prxy %>% remapHosts("www.r-project.org", "www.google.com")
  roogle <- GET("http://www.r-project.org", httr_proxy(prxy))
  roogle %>% read_html %>% xml_find_all("//a") %>% xml_attrs
  
  prxy %>% 
    newPage(ref = "httr_traffic_3")
  auth1 <-GET("http://httpbin.org/basic-auth/user/passwd", 
              httr_proxy(prxy))
  prxy %>% 
    setAutoBAuth("httpbin.org",
                 "user", "passwd")
  auth2 <-GET("http://httpbin.org/basic-auth/user/passwd", 
              httr_proxy(prxy))
  
  auth1$status_code
  auth2$status_code
  content(auth2)
  
  prxy %>% closeProxy
  
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  prxy  %>% 
    rewriteURL(match = 'http://www\\.google\\.com.*', 
               replace = 'http://www\\.r-project\\.org')
  gproj <- GET("http://www.google.com/ncr", httr_proxy(prxy))
  gproj %>% read_html %>% xml_find_all("//title") %>% xml_text

  prxy %>% removeRewrites
  gproj <- GET("http://www.google.com/ncr", httr_proxy(prxy))
  gproj %>% read_html %>% xml_find_all("//title") %>% xml_text
  
  prxy %>% closeProxy
}
