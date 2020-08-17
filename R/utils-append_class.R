# utils-append_class.R

append_class <- function (x, class) {
  if (class %in% class(x)) {
    warning("x is already ", class, " class")
    return(x)
  }
  class(x) <- append(class(x), class, 0)
  x
}
