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
    
    init(textString: String, textString2: String) {
        super.init()
        
        let rect = CGRect(x: 0, y: UIScreen.main.bounds.height*0.95, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.05)
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = UIColor.black
        self.name = "Team"
        self.lineWidth = 0
        
        headerText = SKLabelNode(text: textString)
        headerText.position = CGPoint(x: UIScreen.main.bounds.width*0.02, y: UIScreen.main.bounds.height*0.975)
        headerText.verticalAlignmentMode = .center
        headerText.horizontalAlignmentMode = .left
        headerText.fontName = "HelveticaNeue-Medium"
        headerText.fontSize = UIScreen.main.bounds.height*0.03
        headerText.name = "Header"
        
        headerSubText = SKLabelNode(text: textString2)
        headerText.position = CGPoint(x: UIScreen.main.bounds.width*0.02, y: UIScreen.main.bounds.height*0.975)
        headerSubText.verticalAlignmentMode = .center
        headerSubText.horizontalAlignmentMode = .right
        headerSubText.fontName = "HelveticaNeue-Medium"
        headerSubText.fontSize = UIScreen.main.bounds.height*0.03
        headerSubText.name = "HeaderSub"
        
        self.addChild(headerText)
        self.addChild(headerSubText)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
