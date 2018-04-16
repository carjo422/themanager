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


class serieView: modScene {
    
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    var actSerie = GameScene.currSerie
    var topNode = SKNode()
    
    var roundNode = SKNode()
    var fullNode = SKNode()
    var bottomNode = SKNode()
    var topMenu = SKNode()
    
    var oldLocation = CGPoint(x: 0, y: 0)
    var firstLocation = CGPoint(x: 0, y: 0)
    var delta = CGFloat()
    var totalMove = CGFloat(0)
    var scrollView = scrollNode(startHeight: 0, scrollHeight: 0)
    
    var viewHeight: CGFloat = 0
    
    var nMatches = 0
    
    var area1length = CGFloat(0)
    var area2length = CGFloat(0)
    var area3length = CGFloat(0)
    var area4length = CGFloat(0)
    
    let nTeams = 8
    var iRank:Int = 0
    
    var altColor = UIColor.darkGray
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        /*******************************************Simulation stuff****************************************************/
        
        
        for i in 1...14 {
            actSerie.simulateRound(omgang: i)
        }
        actSerie.liveTable()
        
        
        /****************************************Standard stuff on screen************************************************/
        
        // Topnode
        
        let header = topHeader(textString: String(describing: actSerie.serieName), textString2: "Right ->")
        addChild(header)
        
        
        let widthHeight = screenSize.width/screenSize.height
        
        // TopMenu
        
        //createLink(xK:CGFloat, yK:CGFloat, linkText: String, image: String, id: Int, addNode: SKNode)
        
        createLink(xK: 0.0, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 1, addNode: topMenu, src: "Squad")
        createLink(xK: 0.25*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 2, addNode: topMenu, src: "Tactics")
        createLink(xK: 0.50*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 3, addNode: topMenu, src: "Training")
        createLink(xK: 0.75*widthHeight, yK:0.89, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 4, addNode: topMenu, src: "Group")
        
        topMenu.zPosition = 20
        
        addChild(topMenu)
        
        
        // Bottomnode
        
        createLink(xK: 0.0, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 1, addNode: bottomNode, src: "Team")
        createLink(xK: 0.25*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 2, addNode: bottomNode, src: "Serie")
        createLink(xK: 0.50*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 3, addNode: bottomNode, src: "Match")
        createLink(xK: 0.75*widthHeight, yK:0, w: 0.25*widthHeight, h: 0.06, bgColor: altColor, linkText: "", image: "bottomIcon", id: 4, addNode: bottomNode, src: "News")
        
        bottomNode.zPosition = 20
        
        addChild(bottomNode)
        addChild(roundNode)
        
        
        // Add scroll view
        
        /*scrollView = scrollNode(startHeight: screenSize.height*0.785, scrollHeight: screenSize.height*0.1)
        addChild(scrollView)*/
        
        // Add teams to view
        
        /****************************************Standard stuff on screen************************************************/
        
        for i in 1...nTeams {
            
            for j in 1...8 {
                if actSerie.teams[j].place == i {
                    iRank = j
                }
            }
            
            
            altColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
            
            
            createLink(xK: 0.02, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].place) + ".", image: "", id: iRank, addNode: roundNode, src: "T" + String(actSerie.teams[iRank].id))
            createLink(xK: 0.06, yK:0.87-CGFloat(i)*0.05, w:0.22, h:0.05, bgColor: altColor, linkText: actSerie.teams[iRank].shortName, image: "", id: iRank, addNode: roundNode, src: "T" + String(actSerie.teams[iRank].id))
            createLink(xK: 0.28, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].wins), image: "", id: iRank, addNode: roundNode, src: "")
            createLink(xK: 0.32, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].draw), image: "", id: iRank, addNode: roundNode, src: "")
            createLink(xK: 0.36, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].loss), image: "", id: iRank, addNode: roundNode, src: "")
            createLink(xK: 0.4, yK:0.87-CGFloat(i)*0.05, w:0.05, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].points), image: "", id: iRank, addNode: roundNode, src: "")
            createLink(xK: 0.45, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].gFor), image: "", id: iRank,  addNode: roundNode, src: "")
            createLink(xK: 0.49, yK:0.87-CGFloat(i)*0.05, w:0.04, h:0.05, bgColor: altColor, linkText: String(actSerie.teams[iRank].gCon), image: "", id: iRank,  addNode: roundNode, src: "")
            
        }
        
        // Four last matches
        
        nMatches = 4
        
        for i in 1...nMatches {
            altColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
            
            createLink(xK: 0.02, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.18, h:0.04, bgColor: altColor, linkText: actSerie.matches[i].homeTeam.shortName, image: "", id: actSerie.matches[i].homeTeam.id, addNode: roundNode, src: "")
            createLink(xK: 0.2, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.035, h:0.04, bgColor: altColor, linkText: "-", image: "", id: i, addNode: roundNode, src: "")
            createLink(xK: 0.235, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.18, h:0.04, bgColor: altColor, linkText: actSerie.matches[i].awayTeam.shortName, image: "", id: actSerie.matches[i].awayTeam.id, addNode: roundNode, src: "")
            
            createLink(xK: 0.415, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.04, h:0.04, bgColor: altColor, linkText: String(actSerie.matches[i].homeGoal), image: "", id: i, addNode: roundNode, src: "")
            createLink(xK: 0.455, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.035, h:0.04, bgColor: altColor, linkText: "-", image: "", id: i, addNode: roundNode, src: "")
            createLink(xK: 0.49, yK:0.45-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.04, h:0.04, bgColor: altColor, linkText: String(actSerie.matches[i].awayGoal), image: "", id: i, addNode: roundNode, src: "")
            
        }
        
        // All matches node
        
        nMatches = 56
        
        for i in 1...nMatches {
            altColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
            
            createLink(xK: 0.02, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: actSerie.matches[i].homeTeam.teamName, image: "", id: actSerie.matches[i].homeTeam.id, addNode: fullNode, src: "")
            createLink(xK: 0.19, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: "-", image: "", id: i, addNode: fullNode, src: "")
            createLink(xK: 0.21, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: actSerie.matches[i].awayTeam.teamName, image: "", id: actSerie.matches[i].awayTeam.id, addNode: fullNode, src: "")
            
            createLink(xK: 0.38, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: String(actSerie.matches[i].homeGoal), image: "", id: i, addNode: fullNode, src: "")
            createLink(xK: 0.41, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: "-", image: "", id: i, addNode: fullNode, src: "")
            createLink(xK: 0.44, yK:0.91-CGFloat(i)*0.04-CGFloat(actSerie.matches[i].omgang)*0.05, w:0.5, h:0.05, bgColor: altColor, linkText: String(actSerie.matches[i].awayGoal), image: "", id: i, addNode: fullNode, src: "")
            
            area2length = (2*screenSize.height)
            
        }
        
    }

    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
}
