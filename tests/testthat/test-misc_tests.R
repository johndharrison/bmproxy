context("misctests")

testthat("canPrintProxy", {
  prxy <- proxy(bmpPort = 9090L, port = 39500L)
  expect_silent(
    print(prxy)
  )
})
