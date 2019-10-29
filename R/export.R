#' Exported function
#'
#' A function that uses `chk_true()` on its first argument and calls an internal
#' function with the second argument.
#' The internal function also calls `chk_true()` on its argument.
#'
#' @param first,second Arguments
#' @export
chkchk <- function(first, second) {
  elide(chk_true(first), 0)
  internal(second)
  invisible()
}

internal <- function(second) {
  elide(chk_true(second), 25)
}
