//
//  GameScene.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    static var currSerie = serie()
    static var currPlay = playerObject()
    static var currTeam = teamObject()
    static var currMatch = matchObject()
    
    
    var home_team = SKLabelNode()
    var away_team = SKLabelNode()
    
    var home_team_score = SKLabelNode()
    var away_team_score = SKLabelNode()
    
    var home_team_player1 = SKLabelNode()
    var away_team_player1 = SKLabelNode()
    
    
    override func didMove(to view: SKView) {
        
        GameScene.currSerie.fillTeams()
        GameScene.currSerie.createMatches()
        
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
    
        
        let extScene = serieView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.resizeFill
        
        let transition = SKTransition.fade(with : UIColor(red: 0, green: 0.0, blue: 0, alpha: 1.0), duration: 1)
        self.scene!.view!.presentScene(extScene, transition: transition)
        
        
    }
}
