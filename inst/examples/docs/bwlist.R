\dontrun{
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  library(httr)
  # use httr_proxy to configure proxy for httr
  white_list <- prxy %>% getWhiteList
  white_list
  # set an entry in the white list
  prxy %>% setWhiteList(".*r-project\\.org.*", statusCode = 333L)
  white_list <- prxy %>% getWhiteList
  white_list
  # expect passing sites
  rcran <- GET("https://cran.r-project.org/", httr_proxy(prxy))
  rproj <- GET("https://www.r-project.org/", httr_proxy(prxy))
  # expect 333 status code for non matching url
  goog <- GET("https://www.google.com/", httr_proxy(prxy))
  goog$status_code
  
  # clear the white list
  white_list <- prxy %>% 
    clearWhiteList %>% 
    getWhiteList
  length(white_list)
  
  # get the black list
  black_list <- prxy %>% getBlackList
  black_list
  
  # add site to black list
  prxy %>% addURLBlackList(".*r-project\\.org.*", statusCode = 334L)
  goog <- GET("https://www.google.com/", httr_proxy(prxy))
  
  # expect sites to return 334 status code
  rcran <- GET("https://cran.r-project.org/", httr_proxy(prxy))
  rproj <- GET("https://www.r-project.org/", httr_proxy(prxy))
  rcran$status_code
  rproj$status_code
  
  # clear black list
  black_list <- prxy %>% 
    clearBlackList %>% 
    getBlackList
  length(black_list)

  prxy %>% closeProxy
}
