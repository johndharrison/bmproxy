context("bwlist")

test_that("canSetSingleWhiteList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% setWhiteList("http://www\\.facebook\\.com/.*", 200L)
  )
  whiteList <- prxy %>% getWhiteList
  expect_identical(whiteList[[1]], "http://www\\.facebook\\.com/.*")
})

test_that("canSetMultipleWhiteList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% setWhiteList(
      c("http://www\\.facebook\\.com/.*", "http://cdn\\.twitter\\.com"), 
      200L
    )
  )
  whiteList <- prxy %>% getWhiteList
  expect_identical(whiteList[[1]], "http://www\\.facebook\\.com/.*")
  expect_identical(whiteList[[2]], "http://cdn\\.twitter\\.com")
})

test_that("canClearWhiteList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% setWhiteList("http://www\\.facebook\\.com/.*", 200L)
  )
  whiteList <- prxy %>% getWhiteList
  expect_identical(whiteList[[1]], "http://www\\.facebook\\.com/.*")
  whiteList <- prxy %>% 
    clearWhiteList %>%
    getWhiteList
  expect_identical(whiteList, list())
})

test_that("canAddSingleURLBlackList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    prxy  %>% addURLBlackList("http://www\\.facebook\\.com/.*", 200L)
  )
  blackList <- prxy %>% getBlackList
  prxy %>% clearBlackList
  expect_identical(blackList[1, "urlPattern"], 
                   "http://www\\.facebook\\.com/.*")
})

test_that("canGetBlackList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  prxy  %>% addURLBlackList("http://www\\.facebook\\.com/.*", 200L, "POST")
  prxy  %>% addURLBlackList("http://cdn\\.twitter\\.com", 200L)
  blackList <- prxy %>% getBlackList
  prxy %>% clearBlackList
  expect_identical(blackList[1, "urlPattern"], 
                   "http://www\\.facebook\\.com/.*")
})


test_that("canNotAddMultipleURLBlackList", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_error(
    prxy  %>% addURLBlackList(
      c("http://www\\.facebook\\.com/.*", "http://cdn\\.twitter\\.com"),
      200L
    )
  )
})
