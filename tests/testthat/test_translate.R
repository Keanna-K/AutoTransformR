# This script tests the translate function
# library(testthat)

context("Translate")

test_that("Test that parameters are the correct type", {
  expect_error(translate(6, 5, 2), "Error: image_path is not a string")
  expect_error(translate("img/milad.jpg", "seven", 2), "Error: num_images must be an integer")
  expect_error(translate("img/milad.jpg", 6, "eight"), "Error: max_translation must be an integer")
})

test_that("Test num_images is in valid range", {
  expect_error(translate("img/milad.jpg", -1, 200), "Error: num_images must be 1 or greater")
})

test_that("Test max_translation is in valid range", {
  expect_error(translate("img/milad.jpg", 7, 10000), "Error: max_translation must be less than the width and height of the image")
})

test_that("Test that image file path is correct", {
  expect_error(mirror("not_an_img.jpg"), "Incorrect directory/image not found")
})

test_that("Test function returns", {
  test_img <- readImage("img/milad.jpg")
  returned_arr <- translate("img/milad.jpg", 5, 10)
  expect_equal(tail(dim(returned_arr), 1), 6)
  expect_equal(dim(returned_arr)[-length(dim(returned_arr))], dim(test_img))
})
