# This script tests the translate function
# library(testthat)

context("Rotate")

test_that("Test that parameters are the correct type", {
  expect_error(rotate(6, 5, 2), "Error: image_path is not a string")
  expect_error(rotate("Path", "seven", 2), "Error: num_images must be an integer")
  expect_error(rotate("Path", 6, "eight"), "Error: max_rotation must be an integer")
})

test_that("Test num_images is in valid range", {
  expect_error(rotate("PathTo300x300Image", -1, 200), "Error: num_images must be 1 or greater")
})

test_that("Test max_rotation is in valid range", {
  expect_error(rotate("PathTo300x300Image", 7, 400), "Error: max_rotation must be between 1 and 360, inclusive")
})

test_that("Test function returns", {
  test_img <- readImage("test_img")
  returned_arr <- translate("test_image", 5, 10)
  expect_is(dim(returned_arr)[length(dim(returned_arr))] == 6)
  expect_is(dim(returned_arr)[1:length(dim(test_img))-1] == dim(test_img))
})
