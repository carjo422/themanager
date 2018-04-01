//
//  topHeader.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-27.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class topHeader: SKShapeNode {
    
    var color: String!
    var type: Int!
    
    var headerText : SKLabelNode!
    var headerSubText : SKLabelNode!
    
    init(xD: CGFloat, yD: CGFloat, theBlock : CGSize, fontS: CGFloat, textString: String, textString2: String) {
        super.init()
        
        var rect = CGRect(x: xD, y: yD, width: theBlock.width, height: theBlock.height)
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = UIColor.black
        self.name = "Team"
        self.lineWidth = 0
        
        headerText = SKLabelNode(text: textString)
        headerText.position = CGPoint(x: xD+theBlock.width*0.02, y: yD+theBlock.height/2)
        headerText.verticalAlignmentMode = .center
        headerText.horizontalAlignmentMode = .left
        headerText.fontName = "HelveticaNeue-Medium"
        headerText.fontSize = fontS
        headerText.name = "Header"
        
        headerSubText = SKLabelNode(text: textString2)
        headerSubText.position = CGPoint(x: xD+theBlock.width*0.98, y: yD+theBlock.height/2)
        headerSubText.verticalAlignmentMode = .center
        headerSubText.horizontalAlignmentMode = .right
        headerSubText.fontName = "HelveticaNeue-Medium"
        headerSubText.fontSize = fontS
        headerSubText.name = "HeaderSub"
        
        self.addChild(headerText)
        self.addChild(headerSubText)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
