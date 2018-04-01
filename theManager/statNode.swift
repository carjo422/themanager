//
//  statNode.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-29.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class statNode: SKShapeNode {
    
    let screenSize = UIScreen.main.bounds.height
    
    var statText : SKLabelNode!
    var valText : SKLabelNode!
    
    init(stat: String, value: String) {
        super.init()
        
        
        
        statText = SKLabelNode(text: stat)
        statText.horizontalAlignmentMode = .left
        statText.fontName = "HelveticaNeue-Medium"
        
        statText.position.x = self.position.x
        statText.position.y = self.position.y
        
        statText.fontSize = screenSize*0.02
        
        valText = SKLabelNode(text: value)
        valText.horizontalAlignmentMode = .left
        valText.fontName = "HelveticaNeue-Medium"
        
        valText.position.x = self.position.x + screenSize*0.14
        valText.position.y = self.position.y
        
        valText.fontSize = screenSize*0.02
        
        self.addChild(statText)
        self.addChild(valText)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
