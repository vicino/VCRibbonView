//
//  VCRibbonView.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/21/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class VCRibbonView: UIView {
    
    var start: CGFloat = 40
    var thickness: CGFloat = 30
    var text = "50% Off" {
        didSet {
            ribbonView.text = text
            ribbonView.setNeedsDisplay()
        }
    }
    var ribbonColor = UIColor(red: 165.0/255.0, green: 0.0, blue: 52.0/255.0, alpha: 1.0) {
        didSet {
            ribbonView.backgroundColor = ribbonColor
        }
    }
    private let ribbonView: RibbonView
    
    required init?(coder aDecoder: NSCoder) {
        ribbonView = RibbonView(text: text, backgroundColor: ribbonColor)
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        ribbonView = RibbonView(text: text, backgroundColor: ribbonColor)
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        clipsToBounds = true
        backgroundColor = UIColor.groupTableViewBackgroundColor()
        let frame = CGRectMake(0, 0, self.frame.size.width, thickness)
        ribbonView.frame = frame
        addSubview(ribbonView)
        let rotate = CATransform3DMakeRotation(CGFloat(-M_PI_4), 0, 0, 1)
        ribbonView.layer.transform = rotate
        ribbonView.layer.position = CGPointMake(start, start)
    }
}

private class RibbonView: UIView {
    
    var text: String
    
    init(text: String, backgroundColor: UIColor) {
        self.text = text
        super.init(frame: CGRectZero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override func drawRect(rect: CGRect) {
        let shadowPath = UIBezierPath(rect: rect)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.CGPath
        
        let text = NSString(string: self.text)
        let style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        style.alignment = NSTextAlignment.Center
        
        let attrs = [NSParagraphStyleAttributeName : style, NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 15)!]
        let size = text.sizeWithAttributes(attrs)
        let textX = (rect.width - size.width) / 2
        let textY = (rect.height - size.height) / 2
        let textRect = CGRectMake(textX, textY, size.width, size.height)
        text.drawInRect(textRect, withAttributes: attrs)
    }
}
