#' print0 
#' 
#' Print and object, optionally with attributes
#' 
#' @param x object
#' @param attribs logical; whether to print attributes. (Default: `FALSE`)
#' @param ... additional arguments to the print method
#' 
#' @details 
#' 
#' Print an object without its attributes. 
#' 
#' It is easy to use this quickly for a new class.  Simply:
#'
#'     print.myclass <- base.tools::print0
#' 
#' @seealso  
#' - `strip_attributes`
#' 
#' @examples 
#' 
#' x <- 1:5 
#' attr( x, "foo" ) <- "bar"
#' 
#' print(x)
#' print0(x)
#' print0( x, attribs = TRUE )
#' 
# @export 

print0 <- function(x, attribs=FALSE, ...) { 
  
  if( ! attribs ) 
    x <- strip_attributes(x)
  
  print(x)
    
}
