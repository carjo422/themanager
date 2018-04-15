//
//  GameScene.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: modScene {
    
    static var series = [serie]()
    static var teams = [teamObject]()
    static var players = [playerObject]()
    
    
    

    
    override func didMove(to view: SKView) {
        
        //GameScene.currSerie.fillTeams()
        //GameScene.currSerie.createMatches()
        
        //var team1 = teamObject()
        //team1.generateTeam()
        
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
