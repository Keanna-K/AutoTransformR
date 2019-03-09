rotate <- function(image_path, num_images, max_rotation){
  #'Returns an array of images of length num_images randomly rotated a random degree up to a max_rotation
  #'
  #'Rotate takes the path to an image and generates randomly rotated images, the desired number
  #'of times. Each rotated image will not be rotated more than the maximum rotation angle provided.
  #'
  #' @param image_path string: The file path of the image to be translated.
  #' @param num_images integer: The number of rotated images to be returned.
  #' @param max_rotation integer: The maximum allowable rotation for any of the rotated images. Can be between 1 and 360, inclusive.
  #'
  #' @return array: pixel values of the rotated images
  #' @export
  #'
  #' @examples
  #' \dontrun{
  #' rotate("../tests/testthat/img/milad.jpg", 5, 180)
  #' rotate("../tests/testthat/img/milad.jpg", 10, 320)
  #' rotate("../tests/testthat/img/milad.jpg", 15, 350)
  #' rotate("../tests/testthat/img/milad.jpg", 20, 355)
  #' }

  require(OpenImageR)

  # check for valid input parameter types

  if(!is.character(image_path)){
    stop("Error: image_path is not a string")
  }

  if(!is.numeric(num_images) || num_images %% 1 != 0){
    stop("Error: num_images must be an integer")
  }

  if(!is.numeric(max_rotation) || max_rotation %% 1 != 0 ){
    stop("Error: max_rotation must be an integer")
  }


  # check for valid input parameter values

  if(num_images < 1){
    stop("Error: num_images must be 1 or greater")
  }

  if(max_rotation <  1 | max_rotation > 360){
    stop("Error: max_rotation must be between 1 and 360, inclusive")
  }

  read_image <- function(file_path){
    tryCatch(
      OpenImageR::readImage(file_path),

      # Catch error from readImage
      error=function(e){
        stop("Incorrect directory/image not found")
      }
    )
  }

  org_image <- read_image(image_path)
  rotations = sample(c(1:max_rotation), num_images, replace = TRUE)
  rotated_images = c(org_image)

  for (a_rotation in rotations){
    rotated_images <- c(rotated_images, rotateImage(org_image, a_rotation, mode = 'same'))
  }

  rotated_images <- array(c(org_image, rotated_images), dim = c(dim(org_image), num_images + 1))
}

