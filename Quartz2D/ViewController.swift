//
//  ViewController.swift
//  Quartz2D
//
//  Created by larryhou on 22/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import UIKit

func drawCross(context:CGContext?, center:CGPoint, color:UIColor, length:CGFloat = 20)
{
    let LINE_LENGTH:CGFloat = length
    
    CGContextSetStrokeColorWithColor(context, color.CGColor)
    CGContextMoveToPoint(context,    center.x - LINE_LENGTH, center.y)
    CGContextAddLineToPoint(context, center.x + LINE_LENGTH, center.y)
    CGContextMoveToPoint(context,    center.x, center.y - LINE_LENGTH)
    CGContextAddLineToPoint(context, center.x, center.y + LINE_LENGTH)
    CGContextStrokePath(context)
}

class RadialGradientView:UIView
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

class ContextScaleView:UIView
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let point = CGPoint(x: 100, y: 200)
        drawCross(context, center: center, color: UIColor.redColor(), length:5)
        drawCross(context, center: CGPoint(x: 100, y: 100), color: UIColor.blueColor(), length:5)
        
        let scale:CGFloat = 1.5
        CGContextScaleCTM(context, scale, scale)
        
        drawCross(context, center: CGPoint(x: 0, y: 0), color: UIColor.blackColor(), length:5)
//        CGContextTranslateCTM(context, -(scale - 1) * center.x / scale, -(scale - 1) * center.y / scale)
        CGContextTranslateCTM(context, center.x / scale - point.x,
                                       center.y / scale - point.y)
        drawCross(context, center: point, color: UIColor.redColor(), length:10)
    }
}

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let graph = ContextScaleView(frame: view.frame)
        graph.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        view.addSubview(graph)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

