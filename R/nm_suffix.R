# SUFFIX #

#' @rdname nm_prefix
#' @export

nm_suffix <- function(x, suffix, sep="", ... ) {
  if( is.null( names(x) ) )
    stop( "There is no names attribute for ", deparse(substitute(x)))
  UseMethod( "nm_suffix" )
}

#' @rdname nm_prefix
#' @export

nm_suffix.default <- function(x, suffix, sep="", ...) {
  ext <- paste( suffix, collapse=sep )  # Determine extension to be added
  names(x) <- names(x) %>% str_suffix( ext, sep=sep )
  return(x)
}


#' @rdname nm_prefix
#' @export

nm_suffix.data.frame <- function(x, suffix, sep="", ...) {
  ext <- paste( suffix, collapse=sep )  # Determine extension to be added
  names(x) <- names(x) %>% str_suffix( ext, sep=sep )
  return(x)
}

#' @seealso
#'   (data.table::setnames)[data.table::setattr()]
#'
# @note
#    It may be advantagous to return the data.table, `x` here rather
#    than invisible(NULL)
#
#' @rdname nm_prefix
#' @export

nm_suffix.data.table <- function(x, suffix, sep="", ..., exclude_key ) {

  nms <- names(x)
  if( exclude_key && ! is.null(key(x)) ) {
    nms <- nms %>% setdiff( key(x) )
  }

  ext <- paste( suffix, collapse=sep )  # Determine extension to be added

  setnames(
    x,
    nms,
    nms %>% str_suffix(ext, sep)
  )

  return(invisible(x))
}
