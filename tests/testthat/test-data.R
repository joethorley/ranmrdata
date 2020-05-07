test_that("data", {
  expect_null(chk::check_data(
    ferox@data,
    list(Date = as.Date(c("1994-01-01", "2009-12-31")),
         Fish = factor(1),
         Length = c(400L, 825L),
         Mass = c(0.5, 7.5),
         Age = c(5L, 20L, NA)),
         nrow = 84L,
    key = c("Date", "Fish")))
})
