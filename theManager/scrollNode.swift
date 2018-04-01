//
//  scrollNode.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-04-01.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class scrollNode: SKShapeNode {
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    
    init(startHeight: CGFloat, scrollHeight: CGFloat) {
        
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: screenSize.width*0.95, y: startHeight), size: CGSize(width: screenSize.width*0.05, height: scrollHeight))
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = UIColor.darkGray
        self.alpha = 0.8
        self.lineWidth = 0
        self.zPosition = 50
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
