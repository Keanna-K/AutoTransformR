# This script tests the mirror function
# library(testthat)
# library(OpenImageR)

context("Mirror")

# coloured test image (3D array)
test_img_str <- "img/milad.jpg"
test_img <- readImage("img/milad.jpg")

# black and white test image (2D array)
bw_test_img_str <- "img/bw.png"
bw_test_img <- readImage("img/bw.png")

test_that("Test that parameters are the correct type", {
  expect_error(mirror(test_img_str, 7), "Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  expect_error(mirror(TRUE, "horizontal"), "Error: image_path is not a string")
})

test_that("Test direction is valid string", {
  expect_error(mirror(test_img_str, "h"), "Invalid direction for mirroring. Choose between: 'horizontal', 'vertical', 'all'")
})

test_that("Test that image file path is correct", {
  expect_error(mirror("not_an_img.jpg"), "Incorrect directory/file not found")
})

returned_arr_1a <- mirror(test_img_str, "horizontal")  # should return 2 images, coloured image
returned_arr_1b <- mirror(bw_test_img_str, "vertical")  # should return 2 images, b&w image
returned_arr_2a <- mirror(test_img_str, "all")  # should return 3 images, coloured image
returned_arr_2b <- mirror(bw_test_img_str)  # all is default, should return 3 images, b&w image

test_that("Test for correct output dimensions", {
  expect_equal(dim(returned_arr_1a)[length(dim(returned_arr_1a))], 2)
  expect_equal(dim(returned_arr_1b)[length(dim(returned_arr_1b))], 2)
  expect_equal(dim(returned_arr_2a)[length(dim(returned_arr_2a))], 3)
  expect_equal(dim(returned_arr_2b)[length(dim(returned_arr_2b))], 3)
  expect_equal(dim(returned_arr_1a), c(dim(test_img),2))
  expect_equal(dim(returned_arr_2a)[-length(dim(returned_arr_2b))], dim(test_img)) # check that the 1st image in the array has the same dim as original
})

test_that("Test that horizontal and vertical mirroring are occuring when specified", {
    expect_equal(returned_arr_1a[,1,,2], test_img[,ncol(test_img),])  # check horizontal mirroring occurs in colour photo
    expect_equal(returned_arr_1b[1,,2], bw_test_img[nrow(bw_test_img),])  # check vertical mirroring occurs in b&w photo
    expect_equal(returned_arr_2b[,1,2], bw_test_img[,ncol(bw_test_img)])  # check horizontal mirroring on first image in array in b&w photo
    expect_equal(returned_arr_2a[1,,,3], test_img[nrow(test_img),,])  # check vertical mirroring on second image in array in colour photo

})


