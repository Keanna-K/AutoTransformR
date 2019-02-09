# AutoTransform

### Contributors

| Name | GitHub |
|---|---|
| Alycia Butterworth | [alyciakb](https://github.com/alyciakb) |
| Brenden Everitt | [everittB](https://github.com/everittB) |
| Rayce Rossum | [RayceRossum](https://github.com/RayceRossum) |


### Overview

A common application of supervised machine learning is identifying the object of an image. One issue that users encounter is a model misclassifying a new image because the object is rotated or translated in some way that was not captured in the training images. The purpose of this package is to create a more robust set of images for users to train their model with. The package will accept an image as an input, apply a series of translations to it, as specified by the user, and return an array of translated pixel values. Translations include: rotating, mirroring, and translating (shifting the object's location in the frame).

### Functions

##### Rotate
- Parameters:
  - Image to transform (string: PATH)
  - Number of images to generate (integer)
  - Maximum rotation in degrees (integer)
- Returns:
  - Array of randomly rotated (within max range) images of length based on number of images parameter

##### Mirror
- Parameters:
  - Image to transform (string: PATH)
  - Direction of mirroring (string: 'horizontal', 'vertical', 'both')
- Returns:
  - Array of mirrored image(s)

##### Translate
- Parameters:
  - Image to transform (string: PATH)
  - Number of images to generate (integer)
  - Maximum distance in pixels (integer)
- Returns:
  - Array of randomly translated (within max range) images of length based on number of images parameter


### Similar Packages

Scikit-image is a image processing package that contains functions for performing various operations to images, such as rotating or resizing, among many others. R has a new package, OpenImageR, that is similar to scikit-image that has functions for image preprocessing, filtering, and image recognition. Our plan is to utilize some of these packages functionality and build them out so a user could pass in example images, from a training dataset for example, and get back different variations of them. We believe this could signficantly help in the training of image classification algorthims.
