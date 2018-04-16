//
//  GameScene.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation


class teamView: SKScene {
    
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    var actTeam = GameScene.currTeam
    //var buttonNode = SKNode()
    var topNode = SKNode()

    
    override func didMove(to view: SKView) {
        
        let header = topHeader(textString: actTeam.teamName, textString2: "1a i P13 Östra")
        
        addChild(topNode)
        //addChild(buttonNode)
        topNode.addChild(header)
        
        
        let nPlayers = actTeam.countTeam()
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
