# This script tests the translate function
# library(testthat)

context("Translate")

test_that("Test that parameters are the correct type", {
  expect_error(translate(6, 5, 2), "file_path is not a string")
  expect_error(translate("Path", "seven", 2)), "num_images is not an integer")
  expect_error(translate("Path", 6, "eight")), "max_translation is not an integer")
})

test_that("Test max_translation valid range", {
  expect_error(translate("PathTo300x300Image", 7, 301), "max_translation is outside of the translation range, possible to get empty images")
})

test_that("Test for correct functionality of the function", {
  test_img <- readImage("test_img")
  returned_arr <- translate("test_image", 5, 10)
  expect_is(len(returned_arr) == 5)
  expect_is(dim(returned_arr)[1] == dim(test_img))
})
