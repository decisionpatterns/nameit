#' Set Operations on names
#' 
#' These functions provide operations similar to their base counterparts, except 
#'
#' @param x object with names
#' @param y object with names
#' @param ... additional objects, currently unused
#' 
#' This is like \code{intersect} but works on names instead of values. It 
#' returns tje
#' 
#' @return 
#' character values of names 
#' 
#' @examples 
#' 
#' x <- list( a=1, b=2, c=3 )
#' y <- list( a=5,      c=4, d=0.1 )
#' 
#' nm_intersect( x, y )
#' nm_union( x, y )
#' nm_setdiff( x, y )
#' 
#' @rdname nm_setops
#' @export 

nm_intersect <- function(x, y, ...) { intersect( names(x), names(y) ) }  
  
#' @rdname nm_setops
#' @export 

nm_union <- function(x, y, ... ) { union( names(x), names(y) ) }

#' @rdname nm_setops
#' @export 

nm_setdiff <- function(x, y, ... ) { setdiff( names(x), names(y) ) }

