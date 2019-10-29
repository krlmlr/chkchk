#' Exported function
#'
#' A function that uses `chk_true()` on its first argument and calls an internal
#' function with the second argument.
#' The internal function also calls `chk_true()` on its argument.
#'
#' @param first,second Arguments
#' @export
exported <- function(first, second) {
  chk_true(first)
  internal(second)
}

internal <- function(second) {
  chk_true(second)
}
