\dontrun{
  library(httr)
  library(xml2)
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  
  # filter request
  ua1 <- GET("http://httpbin.org/user-agent", httr_proxy(prxy), 
             user_agent("httr"))
  requestFilter <- "request.headers().remove('User-Agent'); 
  request.headers().add('User-Agent', 'My-Custom-User-Agent-String 1.0');"
  prxy %>% reqInterceptor(requestFilter)
  ua2 <- GET("http://httpbin.org/user-agent", httr_proxy(prxy), 
             user_agent("httr"))
  content(ua1)
  content(ua2)
  prxy %>% closeProxy
  
  #filter response
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  responseFilter <- 
    "contents.setTextContents(
      '<html><body>Response successfully intercepted</body></html>');"
  prxy %>% resInterceptor(responseFilter)
  rproj <- GET("http://r-project.org", httr_proxy(prxy)) 
  rproj %>% read_html %>% xml_find_all("//body") %>% xml_text
}
