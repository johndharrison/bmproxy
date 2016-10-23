context("overwrite")

test_that("canSetHeaders", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% setHeaders(
      list('User-Agent' = 'bmproxy')
    )
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canRemapHost", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% remapHosts("example.com", "1.2.3.4")
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canRemapHostWithHostmap", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% remapHosts(hostMap = list("example.com" = "1.2.3.4"))
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canSetBasicAuth", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% setAutoBAuth("www.example.com", "myUsername", "myPassword")
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canRewriteURL", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% rewriteURL(match = "/foo", replace = "/bar")
  )
  expect_silent(prxy %>% closeProxy)
})

test_that("canRemoveRedirects", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  prxy  %>% rewriteURL(match = "/foo", replace = "/bar")
  expect_silent(prxy %>% removeRewrites)
  expect_silent(prxy %>% closeProxy)
})
