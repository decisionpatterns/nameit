#' Replaced matched patterns in names
#'
#' @param x object with names
#' @param pattern pattern to match
#' @param replacement replacement vector
#'
#' @details
#'
#' `nm_replace` is like `str_replace` but operates on the `names` attribute
#' of `x` rather than a user-supplied string.
#'
#' @examples
#'
#' v <- c( aa=1, ab=2, ac=3 )
#' v
#'
#' v %>% nm_replace( "^a", "b" )
#'
#' @export

nm_replace <- function( x, pattern, replacement ) {

  wh <- str_detect( names(x), pattern )

  attr( x, "names")[wh] <-
    str_replace( names(x[wh]), pattern, replacement )
  x
}
