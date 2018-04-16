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


class teamView: modScene {
    
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    var actTeam = GameScene.currTeam
    //var buttonNode = SKNode()
    var topNode = SKNode()
    var topMenu = SKNode()
    var bottomNode = SKNode()
    
    var squadNode = SKNode()

    
    override func didMove(to view: SKView) {
        
        let header = topHeader(textString: actTeam.teamName, textString2: "1a i P13 Östra")
        
        topNode.addChild(header)
        let widthHeight = screenSize.width/screenSize.height
        
        // TopMenu
        
        //createLink(xK:CGFloat, yK:CGFloat, linkText: String, image: String, id: Int, addNode: SKNode)
        
        createLink(xK: 0.0, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 1, addNode: topMenu, src: "")
        createLink(xK: 0.25*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 2, addNode: topMenu, src: "")
        createLink(xK: 0.50*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 3, addNode: topMenu, src: "")
        createLink(xK: 0.75*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 4, addNode: topMenu, src: "")
        
        topMenu.zPosition = 20
        
        addChild(topMenu)
        
        
        // Bottomnode
        
        createLink(xK: 0.0, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 1, addNode: bottomNode, src: "T" + String(describing : GameScene.defaultTeam))
        createLink(xK: 0.25*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 2, addNode: bottomNode, src: "S" + String(describing : GameScene.defaultSeries))
        createLink(xK: 0.50*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 3, addNode: bottomNode, src: "World")
        createLink(xK: 0.75*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 4, addNode: bottomNode, src: "News")
        
        bottomNode.zPosition = 20
        
        addChild(bottomNode)
        addChild(topNode)
        
        
        let nPlayers = actTeam.countTeam()
        
        createLink(xK: 0.0, yK: 0.82, w: 0.22, h: 0.045, bgColor: UIColor.white, linkText: "Namn:", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.22, yK: 0.82, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "Pos:", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.29, yK: 0.82, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "Skill:", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.36, yK: 0.82, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "Form:", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.43, yK: 0.82, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "Moral:", image: "", id: 0, addNode: squadNode, src: "Z1")
        
        for i in 1...nPlayers {
            createLink(xK: 0.0, yK: 0.82-CGFloat(i)*0.045, w: 0.22, h: 0.045, bgColor: UIColor.white, linkText: GameScene.currTeam.players[i].forName + " " + GameScene.currTeam.players[i].surName, image: "", id: 0, addNode: squadNode, src: "P1")
            createLink(xK: 0.22, yK: 0.82-CGFloat(i)*0.045, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "" + GameScene.currTeam.players[i].position, image: "", id: 0, addNode: squadNode, src: "P1")
            createLink(xK: 0.29, yK: 0.82-CGFloat(i)*0.045, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].total), image: "", id: 0, addNode: squadNode, src: "P1")
            createLink(xK: 0.36, yK: 0.82-CGFloat(i)*0.045, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].form), image: "", id: 0, addNode: squadNode, src: "P1")
            createLink(xK: 0.43, yK: 0.82-CGFloat(i)*0.045, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].moral), image: "", id: 0, addNode: squadNode, src: "P1")
        }
        
        addChild(squadNode)
        
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
