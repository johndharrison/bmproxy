context("bmpserver")

test_that("canCallBmproxy", {
  with_mock(
    `binman::process_yaml` = function(...){},
    `binman::list_versions` = mock_binman_list_versions_bmproxy,
    `binman::app_dir` = mock_binman_app_dir,
    `base::normalizePath` = mock_base_normalizePath,
    `base::list.files` = mock_base_list.files,
    `subprocess::spawn_process` = mock_subprocess_spawn_process,
    `subprocess::process_return_code` =
      mock_subprocess_process_return_code,
    bmPxy <- bmproxy()
  )
  expect_identical(bmPxy$process, "hello")
})

test_that("phantom_verErrorWorks", {
  with_mock(
    `binman::list_versions` = mock_binman_list_versions_bmproxy,
    expect_error(
      bmproxy:::bmpVer("generic", "noversion"),
      "doesnt match versions"
    )
  )
})
