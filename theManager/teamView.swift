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
    var descNode = SKNode()
    var trainingNode = SKNode()
    
    var sortList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var saveSort = 0
    
    var percentArray = [String]()
    
    let testMeter = rollMeter(descText: "", x: 0, y: 0, width: 0, height: 0, altVector: [""])
    let testMeter2 = rollMeter(descText: "", x: 0, y: 0, width: 0, height: 0, altVector: [""])
    let testPercent = rollMeter(descText: "", x: 0, y: 0, width: 0, height: 0, altVector: [""])
    

    
    override func didMove(to view: SKView) {
        
        let header = topHeader(textString: actTeam.teamName, textString2: "1a i P13 Östra")
        
        topNode.addChild(header)
        let widthHeight = screenSize.width/screenSize.height
        
        // TopMenu
        
        //createLink(xK:CGFloat, yK:CGFloat, linkText: String, image: String, id: Int, addNode: SKNode)
        
        createLinkIntern(xK: 0.0, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 1, addNode: topMenu, src: "")
        createLinkIntern(xK: 0.25*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 2, addNode: topMenu, src: "")
        createLinkIntern(xK: 0.50*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 3, addNode: topMenu, src: "")
        createLinkIntern(xK: 0.75*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 4, addNode: topMenu, src: "")
        
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
        
        
        //**************************************************** Squad view *************************************************************************
        
        
        
        addChild(trainingNode)
        /*
        
        addChild(descNode)
        
        createLinkIntern(xK: 0.0, yK: 0.82, w: 0.20, h: 0.04, bgColor: UIColor.white, linkText: "Namn \u{25BE}", image: "", id: 5, addNode: descNode, src: "Z1")
        createLinkIntern(xK: 0.20, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Pos  ", image: "", id: 6, addNode: descNode, src: "Z1")
        createLinkIntern(xK: 0.27, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Skick", image: "", id: 1, addNode: descNode, src: "Z1")
        createLinkIntern(xK: 0.34, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Form ", image: "", id: 2, addNode: descNode, src: "Z1")
        createLinkIntern(xK: 0.41, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Moral", image: "", id: 3, addNode: descNode, src: "Z1")
        createLinkIntern(xK: 0.48, yK: 0.82, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "Lycka", image: "", id: 4, addNode: descNode, src: "Z1")
        
        sortList(onVar: -6)
        saveSort = -6
        
        createList()
 
        */
        
        
         //***************************************************** Training view ********************************************************************
        
        let trainScheme = textField(text: "Träningsschema:")
        trainScheme.position = CGPoint(x:screenSize.height*0.025, y: screenSize.height*0.835)
        
        //trainingNode.addChild(trainScheme)
        
        /*createLinkIntern(xK: 0.03, yK: 0.77, w: 0.1, h: 0.035, bgColor: UIColor.lightGray, linkText: "Måndag", image: "", id: 1, addNode: trainingNode, src: "X1")
        createLinkIntern(xK: 0.13, yK: 0.77, w: 0.1, h: 0.035, bgColor: UIColor.lightGray, linkText: "Tisdag", image: "", id: 2, addNode: trainingNode, src: "X2")
        createLinkIntern(xK: 0.23, yK: 0.77, w: 0.1, h: 0.035, bgColor: UIColor.lightGray, linkText: "Onsdag", image: "", id: 3, addNode: trainingNode, src: "X3")
        createLinkIntern(xK: 0.33, yK: 0.77, w: 0.1, h: 0.035, bgColor: UIColor.lightGray, linkText: "Torsdag", image: "", id: 4, addNode: trainingNode, src: "X4")
        createLinkIntern(xK: 0.43, yK: 0.77, w: 0.1, h: 0.035, bgColor: UIColor.lightGray, linkText: "Fredag", image: "", id: 5, addNode: trainingNode, src: "X5")
        
        createLinkIntern(xK: 0.03, yK: 0.69, w: 0.1, h: 0.08, bgColor: UIColor.lightGray, linkText: "", image: "", id: 6, addNode: trainingNode, src: "X1")
        createLinkIntern(xK: 0.13, yK: 0.69, w: 0.1, h: 0.08, bgColor: UIColor.lightGray, linkText: "", image: "check", id: 7, addNode: trainingNode, src: "X2")
        createLinkIntern(xK: 0.23, yK: 0.69, w: 0.1, h: 0.08, bgColor: UIColor.lightGray, linkText: "", image: "", id: 8, addNode: trainingNode, src: "X3")
        createLinkIntern(xK: 0.33, yK: 0.69, w: 0.1, h: 0.08, bgColor: UIColor.lightGray, linkText: "", image: "check", id: 9, addNode: trainingNode, src: "X4")
        createLinkIntern(xK: 0.43, yK: 0.69, w: 0.1, h: 0.08, bgColor: UIColor.lightGray, linkText: "", image: "check", id: 10, addNode: trainingNode, src: "X5")
        
        createLinkIntern(xK: 0.03, yK: 0.655, w: 0.5, h: 0.035, bgColor: UIColor.lightGray, linkText: "Antal träningar i veckan: 3", image: "", id: 10, addNode: trainingNode, src: "")*/
        
        
        
        for i in 0...20 {
            percentArray.append("\(i*5) %")
        }
        
        let trainDist = textField(text: "Träningsfördelning:")
        trainDist.position = CGPoint(x:screenSize.height*0.025, y: screenSize.height*0.585)
        
        /*2 = rollMeter(descText: "Passningsstil:", x: 100, y: 400, width: 200, height: 20, altVector:["Kort","Kort","Kort","Kort","Varierat","Varierat","Varierat","Varierat","Långt","Långt","Långt","Långt"])*/
        
        let trainArray1 = rollMeter(descText: "Teknik:", x:screenSize.height*0.05, y: screenSize.height*0.515, width: screenSize.height*0.325, height: screenSize.height*0.025, altVector: percentArray)
        let trainArray2 = rollMeter(descText: "Kondition:", x:screenSize.height*0.05, y: screenSize.height*0.445, width: screenSize.height*0.325, height: screenSize.height*0.025, altVector: percentArray)
        let trainArray3 = rollMeter(descText: "Taktik:", x:screenSize.height*0.05, y: screenSize.height*0.375, width: screenSize.height*0.325, height: screenSize.height*0.025, altVector: percentArray)
        let trainArray4 = rollMeter(descText: "Matchspel:", x:screenSize.height*0.05, y: screenSize.height*0.305, width: screenSize.height*0.325, height: screenSize.height*0.025, altVector: percentArray)
        
        /*trainingNode.addChild(trainDist)
        
        trainingNode.addChild(trainArray1)
        trainingNode.addChild(trainArray2)
        trainingNode.addChild(trainArray3)
        trainingNode.addChild(trainArray4)*/
        
        
        let trainStatus = textField(text: "Truppstatus:")
        trainStatus.position = CGPoint(x:screenSize.height*0.025, y: screenSize.height*0.24)
        //trainingNode.addChild(trainStatus)
        
        let trainStat10 = textField(text: "Hälsa:")
        let trainStat15 = textField(text: "90%")
        let trainStat20 = textField(text: "Lycka:")
        let trainStat25 = textField(text: "75%")
        let trainStat30 = textField(text: "Moral:")
        let trainStat35 = textField(text: "80%")
        
        trainStat10.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.19)
        trainStat20.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.15)
        trainStat30.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.11)
        
        trainStat15.position = CGPoint(x: screenSize.height*0.175, y: screenSize.height*0.19)
        trainStat25.position = CGPoint(x: screenSize.height*0.175, y: screenSize.height*0.15)
        trainStat35.position = CGPoint(x: screenSize.height*0.175, y: screenSize.height*0.11)
        
        trainStat10.fontSize = screenSize.height*0.025
        trainStat20.fontSize = screenSize.height*0.025
        trainStat30.fontSize = screenSize.height*0.025
        
        trainStat15.fontSize = screenSize.height*0.025
        trainStat25.fontSize = screenSize.height*0.025
        trainStat35.fontSize = screenSize.height*0.025
        
        /*addChild(trainStat10)
        addChild(trainStat20)
        addChild(trainStat30)
        addChild(trainStat15)
        addChild(trainStat25)
        addChild(trainStat35)*/
        
        
        
        /*
        trainingNode.addChild(testMeter)
        trainingNode.addChild(testMeter2)
         */
        
    }
    
    func createList() {
        
        var k=0
        
        for i in sortList {
            
            k=k+1
            
            print(String(describing: i))
            
            createLink(xK: 0.0, yK: 0.82-CGFloat(k)*0.04, w: 0.2, h: 0.04, bgColor: UIColor.white, linkText: GameScene.currTeam.players[i].forName + " " + GameScene.currTeam.players[i].surName, image: "", id: 20000+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.20, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: "" + GameScene.currTeam.players[i].position, image: "", id: 20100+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.27, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].total), image: "", id: 20200+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.34, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].form), image: "", id: 20300+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.41, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].moral), image: "", id: 20400+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
            createLink(xK: 0.48, yK: 0.82-CGFloat(k)*0.04, w: 0.07, h: 0.04, bgColor: UIColor.white, linkText: String(describing: GameScene.currTeam.players[i].luck), image: "", id: 20400+i, addNode: squadNode, src: "P" + String(GameScene.currTeam.players[i].id))
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
                if onVar == -1 {
                    if GameScene.currTeam.players[sortList[j]].total > GameScene.currTeam.players[sortList[j+1]].total {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 2 {
                    if GameScene.currTeam.players[sortList[j]].form < GameScene.currTeam.players[sortList[j+1]].form {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == -2 {
                    if GameScene.currTeam.players[sortList[j]].form > GameScene.currTeam.players[sortList[j+1]].form {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 3 {
                    if GameScene.currTeam.players[sortList[j]].moral < GameScene.currTeam.players[sortList[j+1]].moral {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == -3 {
                    if GameScene.currTeam.players[sortList[j]].moral > GameScene.currTeam.players[sortList[j+1]].moral {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 4 {
                    if GameScene.currTeam.players[sortList[j]].luck < GameScene.currTeam.players[sortList[j+1]].luck {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == -4 {
                    if GameScene.currTeam.players[sortList[j]].luck > GameScene.currTeam.players[sortList[j+1]].luck {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 5 {
                    if calc_string(inString: GameScene.currTeam.players[sortList[j]].surName) > calc_string(inString: GameScene.currTeam.players[sortList[j+1]].surName) {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == -5 {
                    if calc_string(inString: GameScene.currTeam.players[sortList[j]].surName) < calc_string(inString: GameScene.currTeam.players[sortList[j+1]].surName) {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == 6 {
                    if calc_pos(player: GameScene.currTeam.players[sortList[j]]) > calc_pos(player: GameScene.currTeam.players[sortList[j+1]]) {
                        switch_sortlist(i:i, j:j)
                    }
                }
                if onVar == -6 {
                    if calc_pos(player: GameScene.currTeam.players[sortList[j]]) < calc_pos(player: GameScene.currTeam.players[sortList[j+1]]) {
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
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        for buttons in descNode.children as! [ilink] {
        
        if buttons.src == "Z1" {
            
            buttons.link.text = buttons.link.text?.substring(to: (buttons.link.text?.index((buttons.link.text?.startIndex)!, offsetBy: 5))!)
            
            if buttons.contains(touchLocation) {
            
                
                if buttons.id == saveSort {
                    sortList(onVar: -buttons.id)
                    saveSort = -buttons.id
                    
                    buttons.link.text = buttons.link.text! + " \u{25B4}"
                    
                }
                else {
                    sortList(onVar: buttons.id)
                    saveSort = buttons.id
                    
                    buttons.link.text = buttons.link.text! + " \u{25BE}"
                    
                }
            
                squadNode.removeFromParent()
            
                for children in squadNode.children {
                    children.removeFromParent()
                }
            
                createList()
                
                
            }
            
            }
        
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
}
