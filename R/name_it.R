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

# name_it( "arr_delay" )
# name_it( "arr_delay", prefix="flights" )
# name_it( "arr_delay", suffix="mean" )
# name_it( "arr_delay", "flights", "mean" )
#
# name_it <- function( root, prefix=NULL, suffix=NULL, sep="." ) {
#
#   ret <- root
#   if( ! is.null(prefix) ) ret <- str_prefix( ret, prefix, sep = sep )
#   if( ! is.null(suffix) ) ret <- str_suffix( ret, suffix, sep = sep )
#
#   return(ret)
#
# }
#
#' #' Supply a function with a naming scheme
#'
#'
#' . %>% f1 %>% f2
#'
#'
#' x %>% f1 %>% f2 -> values
#' x %>% f1@name_it %>% f2@name_it ->
#' x %>% get_namer(f1) %>% get_namer(f2)
#'
#' x %n>% f1 %n>%  f2
#'
#'
#' nameit : naming functions
#'
#' The nameit packages allows decoration of functions and function sequences with
#' a namer function that will express a name for a value that is processed through
#' the sequence. Data applied to the function
#'
#'
