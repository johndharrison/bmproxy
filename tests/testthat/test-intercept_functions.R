context("intercept")

test_that("canSetResponseInterceptWithParsingJS", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% resInterceptor(jsFilter = 'alert("foo")')
  )
  expect_silent(
    prxy %>% closeProxy
  )
})

test_that("canNotSetResponseInterceptWithNonParsingJS", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_error(
    prxy %>% resInterceptor(jsFilter = 'alert("foo"'),
    regexp = "HTTP 500"
  )
  expect_silent(
    prxy %>% closeProxy
  )
})

test_that("canSetResquestInterceptWithParsingJS", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% reqInterceptor(jsFilter = 'alert("foo")')
  )
  expect_silent(
    prxy %>% closeProxy
  )
})

test_that("canNotSetRequestInterceptWithNonParsingJS", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_error(
    prxy %>% reqInterceptor(jsFilter = 'alert("foo"'),
    regexp = "HTTP 500"
  )
  expect_silent(
    prxy %>% closeProxy
  )
})
