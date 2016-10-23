context("bandwidth")

test_that("canGetBandwidth", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    bandwidth <- prxy  %>% getBWremaining
  )
  expect_true(inherits(bandwidth, "data.frame"))
})

test_that("canSetBandwidth", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% limitBandwidth(downK = 320L, upK = 240L, downMaxK = 11111L,
                             upMaxK= 2222L)
  )
  bandwidth <- prxy  %>% getBWremaining
  expect_identical(bandwidth$maxUpstreamKB, 2222L)
  expect_identical(bandwidth$maxDownstreamKB, 11111L)
  expect_silent(prxy %>% closeProxy)
})

test_that("canSetBandwidthLatency", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% limitBandwidth(latency = 30L)
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canSetBandwidthPayload", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% limitBandwidth(payPercent = 30L)
  )
  expect_silent(prxy %>% closeProxy)
})
