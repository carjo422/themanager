//
//  File.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-30.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class meter: SKShapeNode {
    
    let screenSize = UIScreen.main.bounds.height
    
    var fillNode: SKShapeNode!
    var textLeft: SKLabelNode!
    var textRight: SKLabelNode!
    
    init(xD: CGFloat, yD: CGFloat, nodeLength: CGFloat, fillLength: CGFloat, nodeColor: UIColor, text1: String, text2: String) {
        super.init()
        
        
        var fillNode = SKShapeNode()
        
        var textLeft = SKLabelNode(text: text1)
        textLeft.position = CGPoint(x: xD, y: yD)
        textLeft.horizontalAlignmentMode = .left
        textLeft.fontName = "HelveticaNeue-Medium"
        textLeft.fontSize = screenSize*0.02
        
        var textRight = SKLabelNode(text: text2)
        textRight.position = CGPoint(x: xD+nodeLength, y: yD)
        textRight.horizontalAlignmentMode = .right
        textRight.fontName = "HelveticaNeue-Medium"
        textRight.fontSize = screenSize*0.018
        
        
        
        let node1rect = CGRect(origin: CGPoint(x: xD, y: yD-screenSize*0.03), size: CGSize(width: nodeLength, height: screenSize*0.02))
        self.path = CGPath(rect: node1rect, transform: nil)
        
        let node2rect = CGRect(origin: CGPoint(x: xD, y: yD-screenSize*0.03), size: CGSize(width: fillLength, height: screenSize*0.02))
        fillNode.path = CGPath(rect: node2rect, transform: nil)
        
        
        self.fillColor = UIColor.black
        self.zPosition = 5
        fillNode.fillColor = UIColor.blue
        fillNode.zPosition = 6
        
        self.addChild(fillNode)
        self.addChild(textLeft)
        self.addChild(textRight)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
