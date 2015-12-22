//
//  UIColor+Darken.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/22/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

extension UIColor {
    func darkenColor() -> UIColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: max(r - 0.1, 0), green: max(g - 0.1, 0), blue: max(b - 0.1, 0), alpha: a)
        }
        
        return UIColor()
    }
}
