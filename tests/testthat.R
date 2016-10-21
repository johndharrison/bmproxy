library(testthat)
library(bmproxy)

if(Sys.getenv("NOT_CRAN") == "true"){
  test_check("bmproxy")
}