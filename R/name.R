#' name
#'
#' Provide a canonical name for an object
#'
#' @param x object
#' @param ...
#'
#' @details
#'
#' `name` provides a canonical name for an object based on it's content and
#' attributes
#'
#' @examples
#'
#' name(1:10)
#'
#' @md
#' @export

name <- function(x, ...) UseMethod('name')

name.default <- function(x, ... ) {

  if( ! is.null( attr(x, "name") ) ) {
    warn("name attribute already exists will not rename.")
    return(x)
  }

  if( is.atomic(x) ) {
    name <- paste( paste0("v[", collapse(range(x), "-"), "]" ), class(x), sep="." )
  } else if( is.recursive(x)) {
    stop("method: name not implemented for arbitrary recursive objects.")
  } else {
    stop("method: name not implemented for that.")
  }

  name

}


# name.integer <- function(x, ...) {
#
#   paste0( "v[", collapse(range(x),":"), "]", "int", collapse="."  )
#
# }

#' @rdname name
#' @import formula.tools
#' @export

name.train.formula <- function(x, sep=".", ...) {

  if( ! require(caret) )
    stop("The caret package must be available to name a train.formula object")

  paste("fit", fit %>% formula %>% lhs %>% as.character, fit$method, nrow(fit$trainingData), sep="." )

}
