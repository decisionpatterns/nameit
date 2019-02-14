#' Conditionally prefix names
#'
#' @param .x object containing named elements
#' @param .predicate function applied to each element of `.x` yielding a logical
#'        vector indicating which names to prefix.
#' @param .prefix string to be used as the prefix
#'
#' @examples
#'   data(iris)
#'   setDT(iris)
#'   nm_prefix_if( iris, is.factor,  "prefix." )
#'
#' @rdname nm_prefix_all
#' @export

nm_prefix_if <- function( .x, .predicate, .prefix ) UseMethod('nm_prefix_if')


#' @rdname nm_prefix_all
#' @export

nm_prefix_if.default <- function( .x, .predicate, .prefix ) {

  wh <- sapply( .x, .predicate )
  names(.x)[wh] <- names(.x)[wh] %>% str_prefix_idem(.prefix)

  .x
}

#' @rdname nm_prefix_all
#' @export

nm_prefix_if.data.table <- function( .x, .predicate, .prefix ) {

  wh <- sapply( .x, .predicate )
  nms <- names(.x)[wh]

  setnames(.x, nms, nms %>% str_prefix_idem(.prefix) )

  invisible(.x)
}


#' @examples
#'   data(iris)
#'   nm_prefix_at( iris, 'Species', 'pre.' )
#'
#' @rdname nm_prefix_all
#' @export
nm_prefix_at <- function( .x, .vars, .prefix ) UseMethod('nm_prefix_at')


#' @rdname nm_prefix_all
#' @export
nm_prefix_at <- function( .x, .vars, .prefix ) {

  wh <- names(.x) %in% .vars
  names(.x)[wh] <- names(.x)[wh] %>% str_prefix_idem(.prefix)

  .x
}


#' @rdname nm_prefix_all
#' @export
nm_prefix_at.data.table <- function( .x, .vars, .prefix ) {

  setnames( .x, .vars, .vars %>% str_prefix_idem(.prefix) )
  invisible(.x)
}
