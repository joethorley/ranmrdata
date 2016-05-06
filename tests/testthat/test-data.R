context("data")

test_that("data", {

  expect_identical(datacheckr::check_data3(
    ferox@data,
    list(Date = as.Date(c("1994-01-01", "2009-12-31")),
         Fish = factor(1),
         Length = c(400L, 825L),
         Mass = c(0.5, 7.5),
         Age = c(5L, 20L, NA)),
         min_row = 84, max_row = 84,
    key = c("Date", "Fish")), ferox@data)
})
