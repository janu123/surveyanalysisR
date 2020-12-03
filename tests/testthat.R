library(testthat)
library(surveyanalysisR)
context("plot_demo")
test_that("X -axis is labelled properly",{
  p <- plot_demo("d_urban")
  expect_true(is.ggplot(p))
})
