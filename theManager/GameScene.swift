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
    /*static var matches = [matchObject]()*/
    
    static var currTeam = teamObject()
    static var currSerie = serie(sName: "", sAge: 0, sRank: 0, id: 1)
    static var currPlayer = playerObject()
    /*static var currMatch = matchObject()*/
    
    static var defaultTeam = 0
    static var defaultSeries = 0
    
    
    let seriesNode = SKNode()

    
    override func didMove(to view: SKView) {
        
        /*self.scaleMode = SKSceneScaleMode.resizeFill*/
        
        createGame()        

        let extScene = overView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.resizeFill
        self.scene!.view!.presentScene(extScene)

 
        
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
