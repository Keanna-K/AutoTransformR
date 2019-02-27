require(OpenImageR)

translate <- function(image_path, num_images, max_translation){
  #' Returns an array of images of length num_images randomly translated a random number of pixels up to max_rotation
  #'
  #'Translate takes the path to and image and generates randomly translated images, the desired number
  #'of times. Each translated image will not be translated more than the maximum distance provided.
  #'The translation can be in any direction.
  #'
  #' @param image_path string: The file path of the image to be translated.
  #' @param num_images integer: The number of translated images to be returned.
  #' @param max_translation integer: The maximum distance in pixels that the image can be translated.
  #'
  #' @return array: pixel values of the translated images
  #' @export
  #'
  #' @examples



  # check for correct function inputs
  if(!is.character(image_path)){
    stop("Error: image_path is not a string")
  }
  if(!file.exists(image_path)){
    stop("Incorrect directory/file not found")
  }

  if(is.character(max_translation)){
    stop("Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  }
  if(is.character(num_images)){
    stop("Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  }
  if(num_images < 1){
    stop("Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  }

  # read in image as array/matrix
  original <- readImage(image_path)

  if(max_translation >= dim(original)[1] | max_translation >= dim(original)[2]){
    stop("Error: direction is not a string, it must be: 'horizonal', 'vertical', 'all'")
  }

  translations_x <- sample(-max_translation:max_translation, num_images, replace = TRUE)
  translations_y <- sample(-max_translation:max_translation, num_images, replace = TRUE)

  translated_images <- c(original)

  for(i in 1:length(translations_x)) { #offset for original being included at the start
    translated_images <- c(translated_images, translation(original, shift_rows = translations_x[i], shift_cols = translations_y[i]))
  }

  translated_images <- array(translated_images, dim = c(dim(original), num_images))

  return(translated_images)
}

translate("/home/rayce/Assignments/Block 5/DSCI 524/AutoTransformR-Master/tests/testthat/img/bw.png", 10, 100)
