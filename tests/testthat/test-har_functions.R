context("har")
test_that("canCreateNewDefaultHAR", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  newHar <- prxy  %>% createHAR
  expect_identical(newHar$status, 204L)
  expect_identical(newHar$har, NULL)
  secondHar <- prxy  %>% createHAR
  expect_identical(secondHar$status, 200L)
  expect_identical(names(secondHar$har), "log")
})

test_that("canCreateNewNamedHAR", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  newHar <- prxy  %>% createHAR(ref = "apples")
  expect_identical(newHar$status, 204L)
  expect_identical(newHar$har, NULL)
  secondHar <- prxy  %>% createHAR(ref = "apples")
  expect_identical(secondHar$status, 200L)
  expect_identical(secondHar$har[["log"]][["pages"]][[1]][['id']], 
                   "apples")
})

test_that("canCreateNewPage", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  np <- prxy %>% createHAR()
  prxy %>% newPage()
  har <- prxy %>% getHAR()
  expect_equal(length(har[["log"]][["pages"]]), 2L)
  expect_identical(har[["log"]][["pages"]][[2]][["id"]], "Page 1")
})

test_that("canCreateNewNamedPage", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  np <- prxy %>% createHAR()
  prxy %>% newPage(ref = 'crazyPage')
  har <- prxy %>% getHAR()
  expect_equal(length(har[["log"]][["pages"]]), 2L)
  expect_identical(har[["log"]][["pages"]][[2]][["id"]], "crazyPage")
})
