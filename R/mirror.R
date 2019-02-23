suppressPackageStartupMessages(library(OpenImageR))

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



  assert("image_path must be a string", is.character(image_path))
  assert("direction must be a string: 'horizontal', 'vertical', or 'all'", is.character(direction))
  assert("Invalid direction for mirroring. Choose between 'horizontal', 'vertical', 'all'", tolower(direction) %in% c("horizontal","vertical", "all"))
  assert("Incorrect directory/file not found", file.exists(image_path)) # finish this line

  original <- readImage(image_path)

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
    mirrored_images <- array(c(original, img), dim = c(original, 2))
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
    mirrored_images <- array(c(original, img), dim = c(original, 2))
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
    mirrored_images <- array(c(original, h_img, v_img), dim = c(original, 3))
  }

  return(mirrored_images)
}
