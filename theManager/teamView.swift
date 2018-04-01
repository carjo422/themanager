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
    
    var actTeam = teamObject()
    var buttonNode = SKNode()
    var topNode = SKNode()
    
    func createButton(xK:CGFloat, yK:CGFloat, bx:CGFloat, by:CGFloat, linkText: String, image: String, bgColor: UIColor, id: Int, area: Int)
    {
        // Create a simple red rectangle that's 100x44
        
        let xKa = xK*UIScreen.main.fixedCoordinateSpace.bounds.height
        let yKa = yK*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let bxa = bx*UIScreen.main.fixedCoordinateSpace.bounds.height
        let bya = by*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let blockSize = CGSize(width: bxa, height: bya)
        
        let button = link(xD: xKa, yD: yKa, theBlock : blockSize, fontS: UIScreen.main.fixedCoordinateSpace.bounds.height*0.025, linkText: linkText, bgColor: bgColor, imageName: image)
        button.id = id
        self.buttonNode.addChild(button)
        
    }
    
    func moveToPlayer() -> Void {
        let extScene = playerView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view!.presentScene(extScene)
    }
    
    
    
    
    override func didMove(to view: SKView) {
        
        actTeam = GameScene.currTeam
        
        let header = topHeader(xD: 0, yD: UIScreen.main.bounds.height*0.95, theBlock : CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05), fontS: UIScreen.main.bounds.height*0.03, textString: actTeam.teamName, textString2: "1a i P13 Östra")
        
        addChild(topNode)
        addChild(buttonNode)
        topNode.addChild(header)
        
        
        let nPlayers = actTeam.countTeam()
        //let teamStrength = actTeam.teamStrength()
        
        for i in 1...nPlayers {
            
            var altColor = UIColor.darkGray
            
            if i % 2 == 0 {
                altColor = UIColor.gray
            }
            
            createButton(xK: 0.0, yK:0.9-CGFloat(i)*0.04, bx: 0.055, by: 0.04, linkText: "FW", image: "", bgColor: altColor, id: i, area: 1)
            createButton(xK: 0.055, yK:0.9-CGFloat(i)*0.04, bx: 0.34, by: 0.04, linkText: actTeam.players[i].forName + " " + actTeam.players[i].surName, image: "", bgColor: altColor, id: i, area: 1)
            createButton(xK: 0.40, yK:0.9-CGFloat(i)*0.04, bx: 0.055, by: 0.04, linkText: String(describing: actTeam.players[i].calcTotal()), image: "", bgColor: altColor, id: i, area: 1)
            createButton(xK: 0.45, yK:0.9-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: "", image: "arrow", bgColor: altColor, id: i, area: 1)
            createButton(xK: 0.49, yK:0.9-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: "", image: "arrow", bgColor: altColor, id: i, area: 1)
        
        }
        
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
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        
        for button in buttonNode.children as! [link] {
        
            if button.contains(touchLocation) {
                GameScene.currPlay = actTeam.players[button.id]
                moveToPlayer()
            }
            
        }
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
