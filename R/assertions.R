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

assert_integer_or_null <- function(x) {
  stopifnot(is.integer(x) || is.null(x))
}

assert_list_or_null <- function(x) {
  stopifnot(is.integer(x) || is.null(x))
}

is_integer <- function(x){
  is.integer(x)
}

assertthat::on_failure(is_integer) <- function(call, env) {
  paste0(deparse(call$x), " should be an integer value.")
}
