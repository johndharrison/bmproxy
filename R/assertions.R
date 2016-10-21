assert_proxy <- function(x) {
  stopifnot(
    inherits(x, "proxy")
  )
}

is_string <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}

assert_string_or_null <- function(x) {
  stopifnot(is_string(x) || is.null(x))
}
