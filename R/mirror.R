mirror <- function(image_path, direction = 'all') {

  #' Mirror an image
  #'
  #'Mirror takes the path to an image and generates a mirrored version of that image in the horizontal direction, vertical direction, or both.
  #'It returns an array of pixel values for the mirrored image(s).
  #'
  #' @param image_path string: the file path of the image to be mirrored
  #' @param direction string: dirction of mirroring. Options: 'horizontal', 'vertical', 'all'. Defaults to 'all'
  #'
  #' @return array/matrix: pixel values of the original image and mirrored image(s)
  #' @export
  #'
  #' @examples
  #' mirror("tests/testthat/img/milad.jpg", "horizontal")
  #' mirror("tests/testthat/img/bw.png", "vertical")
  #' mirror("tests/testthat/img/bw.png", "all")
  #' mirror("tests/testthat/img/milad.jpg")


  require(OpenImageR)

  # check for correct function inputs
  if(!is.character(image_path)){
    stop("Error: image_path is not a string")
  }ins
  if(!is.character(direction)){
    stop("Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  }
  if(!(tolower(direction) %in% c("horizontal","vertical", "all"))){
    stop("Invalid direction for mirroring. Choose between: 'horizontal', 'vertical', 'all'")
  }
  if(!file.exists(image_path)){
    stop("Incorrect directory/image not found")
  }


  # read in image as array/matrix
  original <- OpenImageR::readImage(image_path)

  # mirror in horizontal direction
  if(tolower(direction) == 'horizontal'){
    # coloured image
    if(length(dim(original)) == 3){
      img <- original[, ncol(original):1, ]
    }
    # black & white image
     else {
       img <- original[, ncol(original):1]
     }
    mirrored_images <- array(c(original, img), dim = c(dim(original), 2))
  }

  # mirror in vertical direction
  else if(tolower(direction) == 'vertical'){
    # coloured image
    if(length(dim(original)) == 3){
      img <- original[nrow(original):1, , ]
    }
    # black & white image
    else {
      img <- original[nrow(original):1, ]
    }
    mirrored_images <- array(c(original, img), dim = c(dim(original), 2))
  }

  # mirror in both horizontal and vertical direction
  else {
    # coloured image
    if(length(dim(original)) == 3){
      h_img <- original[, ncol(original):1, ]
      v_img <- original[nrow(original):1, , ]
    }
    # black & white image
    else {
      h_img <- original[, ncol(original):1]
      v_img <- original[nrow(original):1, ]
    }
    mirrored_images <- array(c(original, h_img, v_img), dim = c(dim(original), 3))
  }

  return(mirrored_images)
}
