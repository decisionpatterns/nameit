context("set_namer")

## TODO: Rename context
## TODO: Add more tests

test_that("set_namer", {

 nm <- "price.mean"

 f1 <- mean %>% set_namer( function(x) str_suffix(x,'mean') )
 "price" %>% name_it(f1) %>% expect_equal(nm)



 f2 <- mean %>% set_namer( . %>% str_suffix('mean') )
 "price" %>% name_it(f2) %>% expect_equal(nm)

 f3 <- mean %>% set_namer('mean')
 "price" %>% name_it(f3) %>% expect_equal(nm)

 f4 <- mean %>% set_namer()
 "price" %>% name_it(f4) %>% expect_equal(nm)

 f5 <- set_namer(mean)
 "price" %>% name_it(f5) %>% expect_equal(nm)

# With fseq:
 f <- . %>% mean( na.rm=TRUE )
 f <- set_namer(f)
 "price" %>% name_it(f)   %>% expect_equal(nm)

})
