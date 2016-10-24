\dontrun{
  # A BMP server is assummed running on port 9090
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  library(httr)
  prxy %>% createHAR(ref = "httr_traffic_1")
  # use httr_proxy to configure proxy for httr
  rproj <- GET("https://www.r-project.org/", httr_proxy(prxy))
  httr_har <- prxy %>% getHAR()
  httr_har[["log"]][["entries"]][[1]]["request"]
  httr_har[["log"]][["entries"]][[1]]["response"]
  
  # set new page
  prxy %>% newPage(ref = "httr_traffic_2")
  rcran <- GET("https://cran.r-project.org/", httr_proxy(prxy))
  httr_har <- prxy %>% getHAR()
  vapply(httr_har[["log"]][["pages"]], '[[', character(1), "id")
  # [1] "httr_traffic_1" "httr_traffic_2"
  prxy %>% closeProxy
}
