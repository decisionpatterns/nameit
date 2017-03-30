#' print naming function
#'
#' @param ... arguments passed to print
#'
#' @importFrom base.tools print0
#' @export

print.with_naming <- function(...) {
  message( "A function with_naming:")
  base.tools::print0(...)
}
