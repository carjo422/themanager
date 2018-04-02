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


class serieView: SKScene {
    
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    var actSerie = serie()
    var topNode = SKNode()
    
    var teamButtonNode = SKNode()
    var matchButtonNode = SKNode()
    var allMatchNode = SKNode()
    var allTeamNode = SKNode()
    var bottomNode = SKNode()
    var topMenu = SKNode()
    
    var oldLocation = CGPoint()
    var delta = CGFloat()
    var totalMove = CGFloat(0)
    var scrollView = scrollNode(startHeight: 0, scrollHeight: 0)
    
    var nMatches = 0
    
    func scroll(button: link, delta: CGFloat) {
        button.position.y = button.position.y+delta
    }
    
    
    func moveToTeam() -> Void {
        let extScene = teamView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view!.presentScene(extScene)
    }
    
    func createLink(xK:CGFloat, yK:CGFloat, bx:CGFloat, by:CGFloat, linkText: String, image: String, bgColor: UIColor, id: Int, fSize: CGFloat, addNode: SKNode)
    {
        // Create a simple red rectangle that's 100x44
        
        let xKa = xK*UIScreen.main.fixedCoordinateSpace.bounds.height
        let yKa = yK*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let bxa = bx*UIScreen.main.fixedCoordinateSpace.bounds.height
        let bya = by*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let blockSize = CGSize(width: bxa, height: bya)
        
        let lnk = link(xD: xKa, yD: yKa, theBlock : blockSize, fontS: UIScreen.main.fixedCoordinateSpace.bounds.height*fSize, linkText: linkText, bgColor: bgColor, imageName: image)
        lnk.id = id
        addNode.addChild(lnk)
        
    }
    
    
    
    override func didMove(to view: SKView) {
        
        actSerie = GameScene.currSerie
        
        for i in 1...14 {
            actSerie.simulateRound(omgang: i)
        }
        actSerie.liveTable()
        
        // Topnode
        
        let header = topHeader(xD: 0, yD: UIScreen.main.bounds.height*0.95, theBlock : CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05), fontS: UIScreen.main.bounds.height*0.03, textString: "Pussyfuckers", textString2: "")
        
        addChild(topNode)
        topNode.addChild(header)
        
        
        let widthHeight = screenSize.width/screenSize.height
        
        // TopMenu
        
        createLink(xK: 0.0, yK:0.89, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 1, fSize: 0, addNode: topMenu)
        createLink(xK: 0.25*widthHeight, yK:0.89, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 2, fSize: 0, addNode: topMenu)
        createLink(xK: 0.5*widthHeight, yK:0.89, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 3, fSize: 0, addNode: topMenu)
        createLink(xK: 0.75*widthHeight, yK:0.89, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 4, fSize: 0, addNode: topMenu)
        
        topMenu.zPosition = 20
        
        addChild(topMenu)
        
        
        // Bottomnode
        
        createLink(xK: 0.0, yK:0, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 1, fSize: 0, addNode: bottomNode)
        createLink(xK: 0.25*widthHeight, yK:0, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 2, fSize: 0, addNode: bottomNode)
        createLink(xK: 0.5*widthHeight, yK:0, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 3, fSize: 0, addNode: bottomNode)
        createLink(xK: 0.75*widthHeight, yK:0, bx: 0.25*widthHeight, by: 0.06, linkText: "", image: "bottomIcon", bgColor: UIColor.lightGray, id: 4, fSize: 0, addNode: bottomNode)
        
        bottomNode.zPosition = 20
        
        addChild(bottomNode)
        
        addChild(teamButtonNode)
        addChild(matchButtonNode)
        
        
        // Add scroll view
        
        scrollView = scrollNode(startHeight: screenSize.height*0.85, scrollHeight: screenSize.height*0.1)
        addChild(scrollView)
        
        // Add teams to view
        
        
        let nTeams = 8
        var iRank:Int = 0
        //let teamStrength = actTeam.teamStrength()
        
        for i in 1...nTeams {
            
            for j in 1...8 {
                if actSerie.teams[j].place == i {
                    iRank = j
                }
            }
                
            var altColor = UIColor.darkGray
            
            if i % 2 == 0 {
                altColor = UIColor.gray
            }
            
            createLink(xK: 0.02, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].place) + ".", image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.055, yK:0.87-CGFloat(i)*0.04, bx: 0.225, by: 0.04, linkText: actSerie.teams[iRank].teamName, image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.27, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].wins), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.305, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].draw), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.34, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].loss), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.375, yK:0.87-CGFloat(i)*0.04, bx: 0.06, by: 0.04, linkText: String(actSerie.teams[iRank].points), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.42, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].gFor), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.455, yK:0.87-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].gCon), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            
        }
        
        // Four last matches
        
        nMatches = 4
        
        for i in 1...nMatches {
            let altcolor = UIColor.darkGray
            
            createLink(xK: 0.02, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].homeTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.19, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.02, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.21, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].awayTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: teamButtonNode)
            
            createLink(xK: 0.38, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].homeGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.41, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.44, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].awayGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            
        }
        
        // All matches node
        
        nMatches = 56
        
        for i in 1...nMatches {
            let altcolor = UIColor.darkGray
            
            createLink(xK: 0.02, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].homeTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allTeamNode)
            createLink(xK: 0.19, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.02, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.21, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].awayTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allTeamNode)
            
            createLink(xK: 0.38, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].homeGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.41, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.44, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].awayGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        oldLocation = touchLocation
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        delta = (-touchLocation.y+oldLocation.y)*5/8
        oldLocation = touchLocation
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        
        for button in teamButtonNode.children as! [link] {
            
            if button.contains(touchLocation) {
                GameScene.currTeam = actSerie.teams[button.id]
                moveToTeam()
            }
            
        }
        
        
        
        for button in bottomNode.children as! [link] {
            
            if button.contains(touchLocation) {
                
                if button.id == 1 {
                    matchButtonNode.removeFromParent()
                    teamButtonNode.removeFromParent()
            
                    addChild(allMatchNode)
                    addChild(allTeamNode)
                }
                if button.id == 2 {
                    allMatchNode.removeFromParent()
                    allTeamNode.removeFromParent()
                    
                    addChild(matchButtonNode)
                    addChild(teamButtonNode)
                }
            }
            
        }
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if totalMove + delta >= 0 && totalMove + delta <= screenSize.height*0.5 {
        
        for button in teamButtonNode.children as! [link] {
            scroll(button: button, delta: delta)
            
        }
        for button in matchButtonNode.children as! [link] {
            scroll(button: button, delta: delta)
            
        }
        
        totalMove = totalMove+delta
        scrollView.position.y = screenSize.height*0-totalMove*8/5
            
        }
        
        delta = delta*0.8
        if abs(delta) < 0.1 {
            delta = 0
        }
        
        
    }
}
