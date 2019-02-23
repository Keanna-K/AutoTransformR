# This script tests the mirror function
# library(testthat)
library(OpenImageR)

context("Mirror")

test_img <- readImage("../img/milad.jpg")

test_that("Test that parameters are the correct type", {
  expect_error(mirror(test_img, 7), "direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  expect_error(mirror(True, "horizontal"), "image_path is not a string")
})

test_that("Test direction is valid string", {
  expect_error(mirror(test_img, "h"), "Invalid direction for mirroring. Choose between: 'horizontal', 'vertical', 'all'")
})

test_that("Test that image file path is correct", {
  expect_error(mirror("not_an_img.jpg"), "Incorrect directory/file not found")
})

test_that("Test for correct output dimensions", {
  returned_arr_1a <- pre.mirror(test_img, "horizontal")  # should return 1 image
  returned_arr_1b <- pre.mirror(test_img, "vertical")  # should return 1 image
  returned_arr_2a <- pre.mirror(test_img, "all")  # should return 2 images
  returned_arr_2b <- pre.mirror(test_img)  # all is default, should return 2 images

  expect_equal(dim(returned_arr_1a)[length(dim(returned_arr_1a))], 1)
  expect_equal(dim(returned_arr_2a)[length(dim(returned_arr_2a))], 2)
  expect_equal(dim(returned_arr_2b)[length(dim(returned_arr_2b))], 2)
  expect_equal(dim(returned_arr_1a), dim(test_img))
  expect_equal(dim(returned_arr_2a)[-length(dim(returned_arr_2b))], dim(test_img)) # check that the 1st image in the array has the same dim as original
})

test_that("Test that horizontal and vertical mirroring are occuring when specified", {
  if(direction == "horizontal"){
    expect_equal(returned_arr_1a[,1,], test_img[,ncol(test_img),])  # check horizontal mirroring occurs
  }
  if(direction == "vertical"){
    expect_equal(returned_arr_1a[1,,], test_img[nrow(test_img),,])  # check vertical mirroring occurs
  }
  if(direction == "all"){
    expect_equal(returned_arr_1a[,1,,1], test_img[,ncol(test_img),])  # check horizontal mirroring on first image in array
    expect_equal(returned_arr_1a[1,,,2], test_img[nrow(test_img),,])  # check vertical mirroring on second image in array
  }

})


