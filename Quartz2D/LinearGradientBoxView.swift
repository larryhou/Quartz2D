//
//  LinearGradientBoxView.swift
//  Quartz2D
//
//  Created by larryhou on 22/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import Foundation
import UIKit

//lineStyle(NaN,0x0,1,false,'normal',null,null,3);
//beginGradientFill('linear',[0xFF0000,0xFFFF00,0xFF00,0xFFFF,0xFF,0xFF00FF,0xFF0000],[1,1,1,1,1,1,1],[0,42,93,127,170,212,255],new Matrix(0.278289794921875,0,0,0.181243896484375,389.95,353.45),'pad','rgb',0);
//moveTo(162,205);
//lineTo(617.95,205);
//lineTo(617.95,501.95);
//lineTo(162,501.95);
//lineTo(162,205);
//endFill();

class LinearGradientBoxView:UIView
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(context)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(   path, nil, 162.00, 205.00)
        CGPathAddLineToPoint(path, nil, 617.95, 205.00)
        CGPathAddLineToPoint(path, nil, 617.95, 501.95)
        CGPathAddLineToPoint(path, nil, 162.00, 501.95)
        CGPathAddLineToPoint(path, nil, 162.00, 205.00)
        
        CGContextAddPath(context, path)
        CGContextClip(context)
        
        let colors = [
            UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor,
            UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0).CGColor,
            UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0).CGColor,
            UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0).CGColor,
            UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0).CGColor,
            UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0).CGColor,
            UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor
        ]
        
        var locations = [
            CGFloat(000.0),
            CGFloat(042.0 / 0xFF),
            CGFloat(093.0 / 0xFF),
            CGFloat(127.0 / 0xFF),
            CGFloat(170.0 / 0xFF),
            CGFloat(212.0 / 0xFF),
            CGFloat(255.0 / 0xFF)
        ]
        
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), colors, &locations)
        
        let matrix:(a:CGFloat, b:CGFloat, c:CGFloat, d:CGFloat, tx:CGFloat, ty:CGFloat) = (0.278289794921875, 0, 0, 0.181243896484375, 389.95, 353.45)
        let startPoint = CGPointMake(-819.2 * matrix.a + matrix.tx, -819.2 * matrix.b + matrix.ty)
        let endPoint   = CGPointMake( 819.2 * matrix.a + matrix.tx,  819.2 * matrix.b + matrix.ty)
        print((startPoint, endPoint))
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
        CGContextFillPath(context)
        
        drawCross(context, center: startPoint, color: UIColor.greenColor())
        drawCross(context, center: endPoint  , color: UIColor.blackColor())
        
        CGContextRestoreGState(context)
    }
}