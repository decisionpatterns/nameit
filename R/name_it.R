#' Automatically name metrics
#'
#' Build a name from a naming function
#'
#' @param base string that serves a the root to the name and passed as the first
#'        argument to the namer function
#'
#' @param fun `with_naming` function
#'
#' @details
#'
#' A name is comprised of a prefix, base and suffix
#'
#'
#' @examples
#'
#' nm_mean <- mean %>% set_namer
#'
#' "price" %>% name_it( nm_mean )
#'
#'  retail <- rnorm(50)
#'
#'  retail %>% name_it(nm_mean)
#'
#' @references
#'  - Cf. Kurremkarmerruk (the master namer)
#'
#' @importFrom stringr.tools str_prefix str_suffix
#' @export


name_it <- function(x, fun ) {
  stopifnot( is( fun, "with_naming" ) )
  UseMethod('name_it')
}

#' @rdname name_it
#' @export

name_it.character <- function(x, fun) {

  namer <- get_namer(fun)
  namer(x)

}

#' @rdname name_it
#' @export

name_it.default <- function(x, fun) {
  x <- get_pipe_source(x)
  namer <- get_namer(fun)
  namer(x)
}
