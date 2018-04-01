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
        
        let header = topHeader(xD: 0, yD: UIScreen.main.bounds.height*0.95, theBlock : CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05), fontS: UIScreen.main.bounds.height*0.03, textString: "Pussyfuckers", textString2: "")
        
        addChild(topNode)
        topNode.addChild(header)
        
        
        
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
            
            createLink(xK: 0.0, yK:0.9-CGFloat(i)*0.04, bx: 0.03, by: 0.04, linkText: String(actSerie.teams[iRank].place) + ".", image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.03, yK:0.9-CGFloat(i)*0.04, bx: 0.2, by: 0.04, linkText: actSerie.teams[iRank].teamName, image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.23, yK:0.9-CGFloat(i)*0.04, bx: 0.035, by: 0.04, linkText: String(actSerie.teams[iRank].wins), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.265, yK:0.9-CGFloat(i)*0.04, bx: 0.035, by: 0.04, linkText: String(actSerie.teams[iRank].draw), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.30, yK:0.9-CGFloat(i)*0.04, bx: 0.035, by: 0.04, linkText: String(actSerie.teams[iRank].loss), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.335, yK:0.9-CGFloat(i)*0.04, bx: 0.04, by: 0.04, linkText: String(actSerie.teams[iRank].points), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.38, yK:0.9-CGFloat(i)*0.04, bx: 0.035, by: 0.04, linkText: String(actSerie.teams[iRank].gFor), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.415, yK:0.9-CGFloat(i)*0.04, bx: 0.035, by: 0.04, linkText: String(actSerie.teams[iRank].gCon), image: "", bgColor: altColor, id: actSerie.teams[iRank].place, fSize: 0.02, addNode: teamButtonNode)
            
        }
        
        // Four last matches
        
        nMatches = 4
        
        for i in 1...nMatches {
            let altcolor = UIColor.darkGray
            
            createLink(xK: 0.0, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].homeTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: teamButtonNode)
            createLink(xK: 0.17, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.02, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.19, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].awayTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: teamButtonNode)
            
            createLink(xK: 0.36, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].homeGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.39, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            createLink(xK: 0.42, yK:0.55-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].awayGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: matchButtonNode)
            
        }
        
        // All matches node
        
        nMatches = 56
        
        for i in 1...nMatches {
            let altcolor = UIColor.darkGray
            
            createLink(xK: 0.0, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].homeTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allTeamNode)
            createLink(xK: 0.17, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.02, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.19, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.17, by: 0.04, linkText: actSerie.matches[i].awayTeam.teamName, image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allTeamNode)
            
            createLink(xK: 0.36, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].homeGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.39, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: "-", image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            createLink(xK: 0.42, yK:0.9-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, bx: 0.03, by: 0.04, linkText: String(actSerie.matches[i].awayGoal), image: "", bgColor: altcolor, id: i, fSize: 0.02, addNode: allMatchNode)
            
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        oldLocation = touchLocation
        /*
        matchButtonNode.removeFromParent()
        teamButtonNode.removeFromParent()
        
        addChild(allMatchNode)
        addChild(allTeamNode)
        */
        
        
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
