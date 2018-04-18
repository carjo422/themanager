//
//  GameScene.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit

class playerView: modScene {
    
    let screenSize = UIScreen.main.bounds
    
    var actTeam = teamObject()
    var actPlayer = playerObject()
    var topNode = SKNode()
    var face = SKSpriteNode(imageNamed: "face")
    
    var topMenu =  SKNode()
    var bottomNode = SKNode()
        
    override func didMove(to view: SKView) {
        
        actTeam = GameScene.currTeam
        actPlayer = GameScene.currPlayer

        
        /****************************************Standard stuff on screen************************************************/
        
        // Topnode
        let header = topHeader(textString: actPlayer.forName + " " + actPlayer.surName, textString2: actTeam.teamName)
        
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
        
        let baseStat1 = statNode(stat: "Ålder:", value: String(actPlayer.age))
        let baseStat2 = statNode(stat: "Position:", value: "FW/MF/DF")
        let baseStat3 = statNode(stat: "Fot:", value: "Höger")
        let baseStat4 = statNode(stat: "Längd:", value: "1.41 m")
        
        let skillStat1 = statNode(stat: "Snabbhet:", value: String(actPlayer.speed))
        let skillStat2 = statNode(stat: "Teknik:", value: String(actPlayer.skill))
        let skillStat3 = statNode(stat: "Skott:", value: String(actPlayer.shot))
        let skillStat4 = statNode(stat: "Passning:", value: String(actPlayer.pass))
        let skillStat5 = statNode(stat: "Dribbling:", value: String(actPlayer.dribble))
        let skillStat6 = statNode(stat: "Försvar:", value: String(actPlayer.defence))
        let skillStat7 = statNode(stat: "Styrka:", value: String(actPlayer.courage))
        let skillStat8 = statNode(stat: "Kondition:", value: String(actPlayer.stamina))
        
        let healthMeter = meter(xD: screenSize.height*0.27, yD: screenSize.height*0.865, nodeLength: screenSize.height*0.26, fillLength: screenSize.height*0.26*0.9, nodeColor: UIColor.blue, text1: "Hälsa:", text2: "90%")
        let motivMeter = meter(xD: screenSize.height*0.27, yD: screenSize.height*0.8, nodeLength: screenSize.height*0.26, fillLength: screenSize.height*0.26*0.8, nodeColor: UIColor.blue, text1: "Motivation:", text2: "80%")
        let happyMeter = meter(xD: screenSize.height*0.27, yD: screenSize.height*0.73, nodeLength: screenSize.height*0.26, fillLength: screenSize.height*0.26*0.62, nodeColor: UIColor.blue, text1: "Lycka:", text2: "62%")
        
        
        addChild(topNode)
        
        face.position = CGPoint(x: screenSize.height*0.125, y: screenSize.height*0.8)
        face.size = CGSize(width: screenSize.height*0.2, height: screenSize.height*0.2)
        addChild(face)
        
        baseStat1.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.6)
        baseStat2.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.56)
        baseStat3.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.52)
        baseStat4.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.48)
        
        skillStat1.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.6)
        skillStat2.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.56)
        skillStat3.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.52)
        skillStat4.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.48)
        skillStat5.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.44)
        skillStat6.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.40)
        skillStat7.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.36)
        skillStat8.position = CGPoint(x: screenSize.height*0.35, y: screenSize.height*0.32)
        
        addChild(baseStat1)
        addChild(baseStat2)
        addChild(baseStat3)
        addChild(baseStat4)
        
        addChild(skillStat1)
        addChild(skillStat2)
        addChild(skillStat3)
        addChild(skillStat4)
        addChild(skillStat5)
        addChild(skillStat6)
        addChild(skillStat7)
        addChild(skillStat8)
        
        addChild(healthMeter)
        addChild(motivMeter)
        addChild(happyMeter)
        
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
        _ = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
