//
//  playerLink.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-29.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class link: SKShapeNode {
    
    var color: String!
    var type: Int!
    var link : SKLabelNode!
    var img : SKSpriteNode!
    var linkText: String!
    var bgColor: UIColor!
    var id: Int!
    var area: Int!
    
    init(xD: CGFloat, yD: CGFloat, theBlock : CGSize, fontS: CGFloat, linkText: String, bgColor: UIColor, imageName: String) {
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: xD, y: yD), size: CGSize(width: theBlock.width, height: theBlock.height))
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = bgColor
        self.alpha = 1
        self.lineWidth = 0
        self.id = 0
        
        link = SKLabelNode(text: linkText)
        link.position = CGPoint(x: xD+theBlock.width*0.05, y: yD+theBlock.height/2)
        link.verticalAlignmentMode = .center
        link.horizontalAlignmentMode = .left
        link.fontName = "HelveticaNeue-Medium"
        link.fontSize = fontS
        link.text = linkText
        
        self.addChild(link)
        
        if imageName != "" {
            img = SKSpriteNode(imageNamed: imageName)
            img.position = CGPoint(x: xD+theBlock.width*0.5, y: yD+theBlock.height/2)
            img.size.height = theBlock.height*0.8
            img.size.width = theBlock.width*0.8
    
        
            self.addChild(img)
            
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
