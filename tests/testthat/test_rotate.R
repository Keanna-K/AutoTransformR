# This script tests the rotate function
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

test_that("Test that image file path is correct", {
  expect_error(rotate("not_an_img.jpg", 5, 2), "Incorrect directory/image not found")
})

test_that("Test function returns", {
  test_img <- readImage("img/milad.jpg")
  returned_arr <- rotate("img/milad.jpg", 5, 10)
  expect_equal(tail(dim(returned_arr),1), 6)
  expect_equal(dim(returned_arr)[-length(dim(returned_arr))], dim(test_img))
})
