# AutoTransform

## Contributors

| Name | GitHub |
|---|---|
| Alycia Butterworth | [alyciakb](https://github.com/alyciakb) |
| Brenden Everitt | [everittB](https://github.com/everittB) |
| Rayce Rossum | [RayceRossum](https://github.com/RayceRossum) |


## Overview

A common application of supervised machine learning is identifying the object of an image. One issue that users encounter is a model misclassifying a new image because the object is rotated or translated in some way that was not captured in the training images. The purpose of this package is to create a more robust set of images for users to train their model with. The package will accept an image as an input, apply a series of transformations to it, and return an array of transformed pixel values. Transformations include: rotating, mirroring, and translating (shifting the object's location in the frame).


## Functions

#### Rotate

Rotates an image the user-specified number of times. The image will be rotated to a random degree of roation in the clockwise direction, with the maximum rotation angle specified by the user. The pixel values of the original and rotated images is returned.

#### Mirror

Mirrors an image in the horizontal and/or vertical direction and returns the pixel values of the original and mirrored image(s).

#### Translate

Translate will move an image within its frame, so that the topic of the image will be shifted to a new location in the frame. The distance and direction of translation will be chosen randomly, but the user specifies the maximum distance of the translation and the number of images they want generated. It returns the pixel values of the original and translated images.


## R Environment

OpenImageR is an image processing package in CRAN that contains functions for various operations to images, such as reading and showing the images, rotating, mirroring, and resizing, among other things. The intended usage of AutoTransformR is for the development of a larger set of training images for the training of an image classification algorithms. AutoTransformR's utilizes OpenImageR and base R, but allows the user to transform an image in multiple ways at once and returns the original and transformed images as an array that can be used as a training set in machine learning.


## Installation

```
# install.packages("devtools")
devtools::install_github("UBC-MDS/AutoTransformR")
```


## Usage

### Rotate

`library(AutoTransformR)`

`rotate(image_path, num_images, max_rotation)`

**Arguments:**

- `image_path`: file path of the input image (string)
- `num_images`: number of randomly rotated images to be returned (integer)
- `max_rotation`: maximum allowable degrees of rotation of the images (integer) between 1 and 360

**Output:**

- An array of pixel values of the rotated images. Array contains `num_images` + 1 images (original plus all rotated images)

**Example:**

- `rotate("../tests/testthat/img/milad.jpg", 10, 280)`


### Mirror

`library(AutoTransformR)`

`mirror(image_path, direction)`

**Arguments:**

- `image_path`: file path of the input image (string)
- `direction`: direction of mirroring (string, optional) 'horizontal', 'vertical', or 'all'. If not specified, defaults to 'all'

**Output:**

- An array of pixel values of the mirrored images. Array contains 3 images if `direction = 'all'` (original, horizontally mirrored, vertically mirrored) or 2 images if direction is horizontal or vertical (original image, mirrored image)

**Example:**

- `mirror("../tests/testthat/img/milad.jpg", "horizontal")`


### Translate

`library(AutoTransformR)`

`translate(image_path, num_images, max_translation)`

**Arguments:**

- `image_path`: file path of the input image (string)
- `num_images`: number of randomly translated images to be returned (integer)
- `max_translation`: maximum distance in pixels that the image can be translated (integer)

**Output**

- An array of pixel values of the translated images. Array contains `num_images` + 1 images (original plus all translated images)

**Example:**

- `translate("../tests/testthat/img/milad.jpg", 5, 80)`


## Package Dependencies

- `OpenImageR`


## Full Example Usage & Output

```
# devtools::install_github("UBC-MDS/AutoTransformR")

library(AutoTransformR)
library(OpenImageR)

# perform transformations on the image
m <- mirror("../tests/testthat/img/milad.jpg", "horizontal")
r <- rotate("../tests/testthat/img/milad.jpg", 10, 280)
t <- translate("../tests/testthat/img/milad.jpg", 5, 80)


# Check that the output is a 4D array:
# First 2 dimensions are the image pixel values
# third dim is color (rgb)
# fourth dimension is the number of photos the array contains
dim(m)  # mirror function
dim(r)  # rotate function
dim(t)  # translate function

# View original photo
imageShow(m[,,,1])  # mirror function example

# View one of the translated photos
imageShow(m[,,,2])  # mirror function
imageShow(r[,,,2])  # rotate function
imageShow(t[,,,2])  # translate function

```

## Testing

#### Output of Tests:

```
> library(devtools)
> test()
Loading AutoTransformR
Testing AutoTransformR
??? | OK F W S | Context
??? | 17       | Mirror [1.3 s]
??? |  8       | Rotate [2.2 s]
??? |  8       | Translate [1.0 s]

== Results =====================================================================
Duration: 4.5 s

OK:       33
Failed:   0
Warnings: 0
Skipped:  0

```

#### Code Coverage:

```
> library(covr)
> package_coverage()
AutoTransformR Coverage: 96.97%
R/rotate.R: 94.74%
R/translate.R: 95.00%
R/mirror.R: 100.00%

```
