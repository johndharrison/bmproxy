binman_process_yaml <- function(...){}

mock_binman_list_versions_bmproxy <- function(...){
  list(
    generic = c("2.1.0", "2.1.1", "2.1.2", "2.1.3")
  )
}

mock_base_normalizePath <- function(path, winslash, mustWork){
  path
}

mock_base_list.files <- function(...){
  "some.path"
}

mock_binman_app_dir <- function(...){
  "some.dir"
}

mock_subprocess_spawn_process <- function(...){
  "hello"
}

mock_subprocess_process_return_code <- function(...){
  NA
}
