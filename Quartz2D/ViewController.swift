//
//  ViewController.swift
//  Quartz2D
//
//  Created by larryhou on 22/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import UIKit

func drawCross(context:CGContext?, center:CGPoint, color:UIColor)
{
    let LINE_LENGTH:CGFloat = 20
    
    CGContextSetStrokeColorWithColor(context, color.CGColor)
    CGContextMoveToPoint(context,    center.x - LINE_LENGTH, center.y)
    CGContextAddLineToPoint(context, center.x + LINE_LENGTH, center.y)
    CGContextMoveToPoint(context,    center.x, center.y - LINE_LENGTH)
    CGContextAddLineToPoint(context, center.x, center.y + LINE_LENGTH)
    CGContextStrokePath(context)
}

class GraphView:UIView
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        let space = CGColorSpaceCreateDeviceRGB()
        var locations:[CGFloat] = [0.0, 1.0]
        let colors = [UIColor.whiteColor().CGColor, UIColor.blueColor().CGColor]
        let gradient = CGGradientCreateWithColors(space, colors, &locations)
        
        let startPoint = CGPointMake(180, 180)
        let endPoint = CGPointMake(140, 140);
        
        let startRadius:CGFloat = 10
        let endRadius:CGFloat = 120
        CGContextDrawRadialGradient(context, gradient, startPoint, startRadius, endPoint, endRadius, CGGradientDrawingOptions(rawValue: 0))
        
        CGContextRestoreGState(context)
        CGContextSetLineWidth(context, 1.0)
        
        drawCross(context, center: startPoint, color:UIColor.redColor())
        drawCross(context, center: endPoint  , color:UIColor.greenColor())
    }
}

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let graph = RadialGradientBoxView(frame: view.frame)
        graph.backgroundColor = UIColor.clearColor()
        view.addSubview(graph)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

