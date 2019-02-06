# AutoTransform

### Contributors

| Name | GitHub |
|---|---|
| Alycia Butterworth | [alyciakb](https://github.com/alyciakb) |
| Brenden Everitt | [everittB](https://github.com/everittB) |
| Rayce Rossum | [RayceRossum](https://github.com/RayceRossum) |


### Overview

A common application of supervised machine learning is identifying the object of an image. One issue that users encounter is a model misclassifying a new image because the object is rotated or translated in some way that was not captured in the training images. The purpose of this package is to create a more robust set of images for users to train their model with. The package will accept a set of images as an input, apply a series of translations to them, and return a larger, robust training set. Translations include: rotating, mirroring, shifting the object's location in the frame, darkening, and colour manipulations.

### Functions

##### Rotate
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum rotation in degrees (integer)
- Returns:
  - Array of randomly rotated (within max range) images of length based on number of images parameter

##### Mirror
- Parameters:
  - Image to transform
- Returns:
  - Array of a single mirrored image

##### Translate
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum distance in pixels (integer)
- Returns:
  - Array of randomly translated (within max range) images of length based on number of images parameter

##### Chameleon
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum change in pixel colour (integer)
- Returns:
  - Array of randomly colour modified (within max range) images of length based on number of images parameter

##### Brighten
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum change in pixel brightness (integer)
- Returns:
  - Array of randomly brightened (within max range) images of length based on number of images parameter

##### Darken
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum change in pixel darkness (integer)
- Returns:
  - Array of randomly darkened (within max range) images of length based on number of images parameter

##### Zoom
- Parameters:
  - Image to transform
  - Number of images to generate (integer)
  - Maximum zoom depth (integer)
- Returns:
  - Array of randomly zoomed (within max range) images of length based on number of images parameter


### Similar Packages

Scikit-image is a image processing package that contains functions for performing various operations to images, such as rotating or resizing, among many others. R has a new package, OpenImageR, that is similar to scikit-image that has functions for image preprocessing, filtering, and image recognition. Our plan is to utilize some of these packages functionality and build them out so a user could pass in example images, from a training dataset for example, and get back different variations of them. We believe this could signficantly help in the training of image classification algorthims.
