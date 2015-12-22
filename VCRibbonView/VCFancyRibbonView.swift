//
//  VCFancyRibbonView.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/22/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class VCFancyRibbonView: UIView {

    var thickness: CGFloat = 60
    var text = "Coming soon!" {
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
        ribbonView = RibbonView(text: text, ribbonColor: ribbonColor)
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        ribbonView = RibbonView(text: text, ribbonColor: ribbonColor)
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        clipsToBounds = true
        backgroundColor = UIColor.groupTableViewBackgroundColor()
        let ribbonFrame = CGRectMake(0, 0, self.frame.size.width, thickness)
        ribbonView.frame = ribbonFrame
        addSubview(ribbonView)
    }
}

private class RibbonView: UIView {
    
    var text: String
    var ribbonColor: UIColor
    
    init(text: String, ribbonColor: UIColor) {
        self.text = text
        self.ribbonColor = ribbonColor
        super.init(frame: CGRectZero)
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override func drawRect(rect: CGRect) {
        drawCenterRibbonWithRect(rect)
        drawLeftRibbonSegmentWithRect(rect)
        drawRightRibbonSegmentWithRect(rect)
        
        // draw text
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
    
    private func drawCenterRibbonWithRect(rect: CGRect) {
        let startY = rect.size.height / 2 - 15
        let centerRibbonPath = UIBezierPath()
        centerRibbonPath.moveToPoint(CGPointMake(rect.width / 6, startY))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 5 / 6, startY))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 5 / 6, startY + 30))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 1 / 6, startY + 30))
        centerRibbonPath.closePath()
        
        ribbonColor.setFill()
        centerRibbonPath.fill()
    }
    
    private func drawLeftRibbonSegmentWithRect(rect: CGRect) {
        let startY = rect.size.height / 2 - 15
        let leftPath = UIBezierPath()
        leftPath.moveToPoint(CGPointMake(0, rect.size.height))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 6 + 1, rect.size.height))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 6 + 1, startY + 10))
        leftPath.addLineToPoint(CGPointMake(0, startY + 10))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 10, startY + 27))
        leftPath.closePath()
        
        ribbonColor.darkenColor().setFill()
        leftPath.fill()
    }
    
    private func drawRightRibbonSegmentWithRect(rect: CGRect) {
        let startY = rect.size.height / 2 - 15
        let rightPath = UIBezierPath()
        rightPath.moveToPoint(CGPointMake(rect.size.width, rect.size.height))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 5 / 6 - 1, rect.size.height))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 5 / 6 - 1, startY + 10))
        rightPath.addLineToPoint(CGPointMake(rect.size.width, startY + 10))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 9 / 10, startY + 27))
        rightPath.closePath()
        
        ribbonColor.darkenColor().setFill()
        rightPath.fill()
    }
}
