# IPImage
An easy way to generate circular placeholder images.

[![Documentation](https://img.shields.io/badge/documentation-100%25-brightgreen.svg)](https://raw.githubusercontent.com/bofiaza/IPImage/master/docs/badge.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/bofiaza/IPImage/master/LICENSE)

### Installation
`pod 'IPImage'`

### Usage
```swift
let ipimage = IPImage(text: "Neil Patrick Harris", radius: 30, font: UIFont(name: "Cochin-Italic", size: 30), textColor: nil, randomBackgroundColor: true)
imageView.image = ipimage.generateImage()
```
