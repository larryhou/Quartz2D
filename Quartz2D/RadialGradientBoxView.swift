//
//  RadialGradientBoxView.swift
//  Quartz2D
//
//  Created by larryhou on 23/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import Foundation
import UIKit

//lineStyle(NaN,0x0,1,false,'normal',null,null,3);
//beginGradientFill('radial',[0xFF0000,0xFF89D5],[1,1],[0,255],new Matrix(0.30517578125,0,0,0.30517578125,250,200),'pad','rgb',0);
//moveTo(050.00,050.00);
//lineTo(450.00,050.00);
//lineTo(450.00,350.00);
//lineTo(050.00,350.00);
//lineTo(050.00,050.00);
//endFill();

class RadialGradientBoxView:UIView
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(   path, nil, 050.00, 050.00)
        CGPathAddLineToPoint(path, nil, 450.00, 050.00)
        CGPathAddLineToPoint(path, nil, 450.00, 350.00)
        CGPathAddLineToPoint(path, nil, 050.00, 350.00)
        CGPathAddLineToPoint(path, nil, 050.00, 050.00)
        CGContextAddPath(context, path)
        CGContextClip(context)
        
        let colors = [
            UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor,
            UIColor(red: 1.0, green: 0x89/0xFF, blue: 0xD5/0xFF, alpha: 1.0).CGColor
        ]
        
        var locations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), colors, &locations)
        
        let matrix:(a:CGFloat, b:CGFloat, c:CGFloat, d:CGFloat, tx:CGFloat, ty:CGFloat) = (0.30517578125, 0, 0, 0.30517578125, 250, 200)
        let center = CGPointMake(matrix.tx, matrix.ty)
        print(center)
        
        let bounds = CGContextGetClipBoundingBox(context)
        let radius = sqrt(bounds.width * bounds.width + bounds.height * bounds.height) / 2
        
        CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, CGGradientDrawingOptions(rawValue: 0))
        CGContextFillPath(context)
        
        drawCross(context, center: center  , color: UIColor.yellowColor())
        CGContextRestoreGState(context)
    }
}
