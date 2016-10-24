library(testthat)
library(bmproxy)
library(httr)

if(Sys.getenv("NOT_CRAN") == "true"){
  test_check("bmproxy")
}
