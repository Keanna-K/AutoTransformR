# This script tests the translate function
# library(testthat)

context("Rotate")

test_that("Test that parameters are the correct type", {
  expect_error(rotate(6, 5, 2), "file_path is not a string")
  expect_error(rotate("Path", "seven", 2), "num_images is not an integer")
  expect_error(rotate("Path", 6, "eight"), "max_rotation is not an integer")
})

test_that("Test max_rotation in valid range", {
  expect_error(rotate("PathTo300x300Image", 7, 400), "max_rotation is outside of the valid range")
})

test_that("Test function returns", {
  test_img <- readImage("test_img")
  returned_arr <- translate("test_image", 5, 10)
  expect_is(len(returned_arr) == 5)
  expect_is(dim(returned_arr)[1] == dim(test_img))
})
