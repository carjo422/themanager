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
    
    var sortList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    var sortedStyle = 1

    
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
        
        createList()
        
    }
    
    func createList() {
        
        createLink(xK: 0.0, yK: 0.82, w: 0.20, h: 0.04, bgColor: UIColor.white, linkText: "Namn", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.20, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Pos", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.27, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Skick", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.34, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Form", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.41, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Moral", image: "", id: 0, addNode: squadNode, src: "Z1")
        createLink(xK: 0.48, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Lycka", image: "", id: 0, addNode: squadNode, src: "Z1")
        
        var k=0
        
        for i in sortList {
            
            k=k+1
            
            print(String(describing: i))
            
            createLink(xK: 0.0, yK: 0.82-CGFloat(k)*0.04, w: 0.2, h: 0.045, bgColor: UIColor.white, linkText: GameScene.currTeam.players[i].forName + " " + GameScene.currTeam.players[i].surName, image: "", id: 20000+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.20, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: "" + GameScene.currTeam.players[i].position, image: "", id: 20100+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.27, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].total), image: "", id: 20200+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.34, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].form), image: "", id: 20300+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.41, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].moral), image: "", id: 20400+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.48, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.045, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].luck), image: "", id: 20400+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
        }
        
        addChild(squadNode)
    }
    
    func sortList(onVar: Int) {
        
        for i in 0...19 {
            for j in 0...18 {
                
                if onVar == 1 {
                    if GameScene.currTeam.players[sortList[j]].total < GameScene.currTeam.players[sortList[j+1]].total {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 2 {
                    if GameScene.currTeam.players[sortList[j]].total > GameScene.currTeam.players[sortList[j+1]].total {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 3 {
                    if GameScene.currTeam.players[sortList[j]].total < GameScene.currTeam.players[sortList[j+1]].form {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 4 {
                    if GameScene.currTeam.players[sortList[j]].total > GameScene.currTeam.players[sortList[j+1]].form {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 5 {
                    if GameScene.currTeam.players[sortList[j]].total < GameScene.currTeam.players[sortList[j+1]].moral {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 6 {
                    if GameScene.currTeam.players[sortList[j]].total > GameScene.currTeam.players[sortList[j+1]].moral {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 7 {
                    if GameScene.currTeam.players[sortList[j]].total < GameScene.currTeam.players[sortList[j+1]].luck {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 8 {
                    if GameScene.currTeam.players[sortList[j]].total > GameScene.currTeam.players[sortList[j+1]].luck {
                        switch_sortlist(i:i, j:j)
                    }
                }
            }
        
        }
        
    }
    
    func switch_sortlist(i: Int,j: Int) {
        
        var temp1 = 0
        var temp2 = 0
        
        temp1 = sortList[j]
        temp2 = sortList[j+1]
        
        sortList[j] = temp2
        sortList[j+1] = temp1
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        sortList(onVar: sortedStyle)
        
        squadNode.removeFromParent()
        
        for children in squadNode.children {
            children.removeFromParent()
        }
        
        createList()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
