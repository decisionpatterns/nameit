#' the_name_after
#'
#' Get the name following the name provided
#'
#' @param .data object; an object with a names vector, usually a table
#' @param name
#'
#' @details
#'
#' `the_name_after` returnes
#'
#' @return string; the name
#'
#' @export

the_name_after <- function(.data, name) {
    names(.data)[ which( names(.data) == name ) + 1 ]
}
