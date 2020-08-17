# test-nm_prefix.R -- test nm_prefix and nm_suffix

context("nm_prefix")

names.prefixed <-
  c("var_Sepal.Length", "var_Sepal.Width", "var_Petal.Length", "var_Petal.Width", "var_Species")

data(iris)
iris <- nm_prefix( iris, "var_" )
expect_equal( names(iris), names.prefixed  )


rm(iris)
data(iris)
setDT(iris)
nm_prefix( iris, "var_" )
expect_equal( names(iris), names.prefixed )



context("nm_suffix")

names.suffixed <-
  c("Sepal.Length_var", "Sepal.Width_var", "Petal.Length_var", "Petal.Width_var", "Species_var")

# rm(iris)
data(iris)
iris <- nm_suffix( iris, "_var" )
expect_equal(names(iris), names.suffixed )


rm(iris)
data(iris)
setDT(iris)
nm_suffix( iris, "_var" )
expect_equal(names(iris), names.suffixed )

