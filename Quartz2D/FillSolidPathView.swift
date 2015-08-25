//
//  FillSolidPathView.swift
//  Quartz2D
//
//  Created by larryhou on 23/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import Foundation
import UIKit

class FillSolidPathView:UIView
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGPathCreateMutable()
        
        // LINE STYLE -> NEW PATH
        CGPathMoveToPoint(path, nil, 479.90, 101.80)
        CGPathAddLineToPoint(path, nil, 279.90, 448.20)
        CGPathAddLineToPoint(path, nil,  20.10, 298.20)
        CGPathAddLineToPoint(path, nil, 220.10, -48.20)
        CGPathAddLineToPoint(path, nil, 479.90, 101.80)
        // STROKE SOLID
        
        CGContextAddPath(context, path)
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextFillPath(context)
    }
}
