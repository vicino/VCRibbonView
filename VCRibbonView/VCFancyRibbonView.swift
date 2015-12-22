//
//  VCFancyRibbonView.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/22/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class VCFancyRibbonView: UIView {

    var text = "Limited Time Only" {
        didSet {
            ribbonView.text = text
            ribbonView.setNeedsDisplay()
        }
    }
    var ribbonColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1) {
        didSet {
            ribbonView.backgroundColor = ribbonColor
        }
    }
    private var ribbonView: RibbonView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ribbonView = RibbonView(text: text, ribbonColor: ribbonColor, thickness: frame.size.height)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ribbonView = RibbonView(text: text, ribbonColor: ribbonColor, thickness: frame.size.height)
        initialize()
    }
    
    private func initialize() {
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        let ribbonFrame = bounds
        ribbonView.frame = ribbonFrame
        addSubview(ribbonView)
    }
}

private class RibbonView: UIView {
    
    var text: String
    var ribbonColor: UIColor
    var thickness: CGFloat
    var ribbonThickness: CGFloat {
        get {
            return thickness * 5 / 6
        }
    }
    
    init(text: String, ribbonColor: UIColor, thickness: CGFloat) {
        self.text = text
        self.ribbonColor = ribbonColor
        self.thickness = thickness
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
        let textY = (ribbonThickness - size.height) / 2
        let textRect = CGRectMake(textX, textY, size.width, size.height)
        text.drawInRect(textRect, withAttributes: attrs)
    }
    
    private func drawCenterRibbonWithRect(rect: CGRect) {
        let startY: CGFloat = 0
        let centerRibbonPath = UIBezierPath()
        centerRibbonPath.moveToPoint(CGPointMake(rect.width / 6, startY))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 5 / 6, startY))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 5 / 6, ribbonThickness))
        centerRibbonPath.addLineToPoint(CGPointMake(rect.width * 1 / 6, ribbonThickness))
        centerRibbonPath.closePath()
        
        ribbonColor.setFill()
        centerRibbonPath.fill()
    }
    
    private func drawLeftRibbonSegmentWithRect(rect: CGRect) {
        let startY = rect.size.height / 6
        let leftPath = UIBezierPath()
        leftPath.moveToPoint(CGPointMake(0, rect.size.height))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 6 + 1, rect.size.height))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 6 + 1, startY))
        leftPath.addLineToPoint(CGPointMake(0, startY))
        leftPath.addLineToPoint(CGPointMake(rect.size.width / 10, ribbonThickness / 2 + startY))
        leftPath.closePath()
        
        ribbonColor.darkenColor().setFill()
        leftPath.fill()
    }
    
    private func drawRightRibbonSegmentWithRect(rect: CGRect) {
        let startY = rect.size.height / 6
        let rightPath = UIBezierPath()
        rightPath.moveToPoint(CGPointMake(rect.size.width, rect.size.height))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 5 / 6 - 1, rect.size.height))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 5 / 6 - 1, startY))
        rightPath.addLineToPoint(CGPointMake(rect.size.width, startY))
        rightPath.addLineToPoint(CGPointMake(rect.size.width * 9 / 10, ribbonThickness / 2 + startY))
        rightPath.closePath()
        
        ribbonColor.darkenColor().setFill()
        rightPath.fill()
    }
}
