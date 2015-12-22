# VCRibbonView

## Overview

Collection of custom UIViews that will draw various styled ribbons.

## Requirements
* Works on any iOS device

### Simple Usage

### Types of Ribbons
- VCRibbonView
- VCFancyRibbonView

#### Basic
To add a `VCRibbonView` to your app, add the lines:

```swift
let ribbonView = VCRibbonView(frame: CGRectMake(100, 100, 200, 200))
view.addSubview(ribbonView)
```

This creates one of the following views:

![example1](https://github.com/vicino/VCRibbonView/blob/master/VCRibbonView/Readme Assets/CornerRibbon.png)
![example2](https://github.com/vicino/VCRibbonView/blob/master/VCRibbonView/Readme Assets/FancyRibbon.png)

#### Customizable Properties

- thickness
- ribbonColor
- text
