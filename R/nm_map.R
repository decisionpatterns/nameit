#' Map names using function
#'
#' #' Data.frame of old => new names
#' @export

nm_map <- function (data, fun)
{
  nms.old <- data %>% copy() %>% names()
  nms.new <- data %>% copy() %>% conform(fun) %>% names
  ret <- data.frame(old = nms.old, new = nms.new)
  if (is.data.table(data))
    setDT(ret)
  ret
}
