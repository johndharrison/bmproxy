context("misctests")

test_that("canPrintProxy", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_output(
    print(prxy)
  )
})

test_that("shouldFailIfnoBMP", {
  expect_error(
    prxy <- proxy(bmpPort = 2222L, port = 39500L)
  )
})

test_that("canUseHttrWithBMP", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  prxy %>% createHAR(ref = "httr_traffic")
  expect_silent(
    rproj <- GET("https://www.r-project.org/", httr_proxy(prxy))
  )
  httr_har <- prxy %>% getHAR()
  req <- httr_har[["log"]][["entries"]][[1]][["request"]]
  res <- httr_har[["log"]][["entries"]][[1]][["response"]]
  expect_identical(req$url, "https://www.r-project.org/")
  expect_identical(res$status, 200L)
  prxy %>% closeProxy
})
