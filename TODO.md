# TODO.md

 - Change pkgname to `namethat` or split into `name.tools` and `namethat`
 - Add `name` method to provide a canonical name 
 - Add `named` class; to provide for a `name` attributed; `as.named`
 - Support dplyr select type semantics for naming 
 
 - Expand role of `name_it` to name arbitrary objects, such as `caret::train` 
   objects.  For example:

       fit %>% name_it()   # "fit.profit.glm"
 
 - [ ] Rename to tidynames 
   Tidynames provides a tidyverse compliant toolkit for working with object names
 
