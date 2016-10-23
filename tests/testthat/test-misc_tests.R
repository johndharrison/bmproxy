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
