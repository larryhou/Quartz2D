//
//  DrawingView.swift
//  Quartz2D
//
//  Created by larryhou on 26/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import Foundation
import UIKit

class DrawingView:UIView
{
    func test()
    {
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        print(context)
        
        drawCross(context, center: CGPoint(x: 10, y: 10), color: UIColor.blackColor(), length: 10)
        
        UIGraphicsEndImageContext()
    }
}
