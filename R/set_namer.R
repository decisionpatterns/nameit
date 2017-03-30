#' set_namer / get_namer
#'
#' sets or gets the `namer` attribute that
#'
#' @param fun function or fseq to convert to a naming function
#' @param namer function or string; See Details.
#'
#' @details
#'
#' `set_namer` is a function decorator that adds/updates a `namer`` attribute of
#' `fun`.
#'
#' The `namer` argument can either be a string or function. If a function, this
#' is used as the naming function.  string, the
#' naming function is to use this function as a suffix    `
#'
#' @seealso
#' - `name_it``
#'
#' @return
#'
#' A function with an appended class.
#'
#' @examples
#'
#' # With functions:
#'
#'  f1 <- mean %>% set_namer( function(x) str_suffix(x,'mean') )
#'  "price" %>% name_it(f1)       # "price.mean"
#'
#'  f2 <- mean %>% set_namer( . %>% str_suffix('mean') )
#'  "price" %>% name_it(f2)       # "price.mean"
#'
#'  f3 <- mean %>% set_namer('mean')
#'  "price" %>% name_it(f3)       # "price.mean"
#'
#'  f4 <- mean %>% set_namer()
#'  "price" %>% name_it(f4)       # "price.mean"
#'
#'  f5 <- set_namer(mean)
#'  "price" %>% name_it(f5)       # "price.mean"
#'
#' # With fseq:
#'  f <- . %>% mean( na.rm=TRUE )
#'  f <- set_namer(f)
#'  "price" %>% name_it(f)        # "price.mean"
#'
#'
#' @importFrom base.tools is.string
#' @export

set_namer <- function(fun, namer, ... ) UseMethod('set_namer')


#' @rdname set_namer
#' @export

set_namer.function <- function( fun, namer=NULL, ... ) {

  # namer is null
  if( is.null(namer) )
    namer <- lazyeval::expr_text(fun)

  # fun was a pipe
  if( base.tools::is.string(namer) && namer == ".")
    namer <- get_pipe_source(fun)

  # namer is function
  if( is.function(namer) ) name_fun <- namer

  # ...
  # if( namer == "." )

  # name is a sting
  if( is.string(namer) )
    name_fun <- function(x) stringr.tools::str_suffix(x, namer)


  ## Set `namer` Attribute
  attr( fun, "namer" ) <- name_fun
  fun %<>% append_class("with_naming")

  return(fun)

}


#' @rdname set_namer
#' @export

set_namer.fseq <- function( fun, namer=NULL, ... ) {

  namer = as.character( body( functions(fun)[[1]]  )[[1]] )


  if( is.string(namer) )
    name_fun <- function(x) stringr.tools::str_suffix(x, namer )


  ## Set `namer` Attribute
  attr( fun, "namer" ) <- name_fun
  fun %<>% append_class("with_naming")

  return(fun)

}



#' @details
#'
#' `get_namer` retrieves the naming function.
#'
#' @rdname set_namer
#' @export

get_namer <- function( fun )
  attr( fun, "namer")
