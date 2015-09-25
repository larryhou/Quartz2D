//
//  Quartz2DTests.swift
//  Quartz2DTests
//
//  Created by larryhou on 22/8/2015.
//  Copyright © 2015 larryhou. All rights reserved.
//

import XCTest
@testable import Quartz2D

class Quartz2DTests: XCTestCase
{
    func testPerformanceExample()
    {
        let rect = UIScreen.mainScreen().bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
        
        let shape = ShapeView(frame: rect)
        self.measureBlock
        {
            shape.drawRect(rect)
        }
    }
    
}
