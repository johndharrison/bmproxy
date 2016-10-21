context("session")

test_that("canOpenPort", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  ports <- prxy  %>% getPorts
  expect_true(inherits(ports[[1]], "proxy"))
  expect_identical(ports[[1]]$port, 39500L)
})

test_that("canCloseProxy", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  ports <- prxy  %>% getPorts
  expect_identical(length(ports), 1L)
  prxy %>% closeProxy
  ports <- prxy  %>% getPorts
  expect_identical(length(ports), 0L)
})

test_that("closingClosedProxyGivesError", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(prxy %>% closeProxy)
  expect_error(prxy %>% closeProxy)
})

test_that("canWaitForTrafficToBeQuiet", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% waitForTraffic(quietPeriod = 2000L, timeOut = 5000L)
  )
})

test_that("canSetTimeOuts", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% timeouts(requestTimeout = 10000L, 
                      connectionTimeout = 10000L,
                      readTimeout = 10000L,
                      dnsCacheTimeout = -1L)
  )
})

test_that("canSetRetryCount", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% setRetry(retryCount = 1L)
  )
})

test_that("canEmptyDNSCache", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy %>% emptyDNS
  )
})