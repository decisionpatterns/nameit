#' Add a prefix or suffix to the names of an object
#'
#' Adds a prefix or suffix to the names attributes.
#'
#' @param x object with a names attribute
#' @param prefix character; prefix collapsed to string by `sep` and
#' added to the front of each name
#' @param suffix character; collapsed to string by `sep` and
#' added to the back of each name.
#' @param sep string used to collapse and seperate `prefix` or
#' `suffix` from names. The default is not to use a separator.
#' @param exclude_key logical; if `TRUE` do not mangle the object's keys.
#' (DEFAULT: `TRUE`)
#' @param ... additional arguments
#'
#' @details
#'
#' `nm_prefix` and `nm_suffix` add a prefix or suffix to the names of
#' an object.
#'
#' The method for data.table objects are modified by reference.
#'
#' @return
#'   An object with the names altered by a prefix or suffix. For data.tables,
#'   these are returned invisibly.
#'
#' @seealso
#'   [stringr.tools::str_prefix()] which is used by these functions
#'
#' @examples
#'
#' # nm_prefix
#'
#'   data(iris)
#'   iris <- nm_prefix( iris, "var_" )
#'   names(iris)
#'
#'   data(iris)
#'   setDT(iris)
#'   nm_prefix( iris, "var_" )
#'   names(iris)
#'
#' # nm_suffix
#'   data(iris)
#'   iris <- nm_suffix( iris, "_var" )
#'   names(iris)
#'
#'   data(iris)
#'   setDT(iris)
#'   nm_suffix( iris, "_var" )
#'   names(iris)
#'
#' @rdname nm_prefix
#' @import stringr.tools
#' @export

# PREFIX
# ---------------------------------------------------------------

nm_prefix <- function(x, prefix, sep="", ... ) {
  if( is.null( names(x) ) )
    stop( "There is no names attribute for ", deparse(substitute(x)))
  UseMethod( "nm_prefix" )
}



#' @rdname nm_prefix
#' @export

nm_prefix.default <- function(x, prefix, sep="", ...) {

  ext <- paste( prefix, collapse=sep )  # Determine extension to be added

  names(x) <- names(x) %>% str_prefix( ext, sep=sep )
  return(x)
}


#' @rdname nm_prefix
#' @export

nm_prefix.data.frame <- function(x, prefix, sep="", ...) {

  ext <- paste( prefix, collapse=sep )  # Determine extension to be added

  names(x) <- names(x) %>% str_prefix( ext, sep=sep )
  return(x)
}

#' @seealso
#'   (setnames)[data.table::setattr()]
#'
# @note
#    It may be advantagous to return the data.table, `x` here rather
#    than invisible(NULL)
#
#' @rdname nm_prefix
#' @import data.table
#' @export

nm_prefix.data.table <- function(x, prefix, sep="", exclude_key = TRUE ) {

  nms <- names(x)
  if( exclude_key && ! is.null(key(x)) ) {
    nms <- nms %>% setdiff( key(x) )
  }

  ext <- paste( prefix, collapse=sep )  # Determine extension to be added

  setnames(
    x,
    nms,
    nms %>% str_prefix(ext, sep)
  )

  return(invisible(x))

}


# SUFFIX #

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
