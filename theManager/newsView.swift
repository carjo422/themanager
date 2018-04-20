//
//  OverView.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation


class newsView: modScene {
    
    
    let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
    
    var topNode = SKNode()
    
    var seriesNode = SKNode()
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
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        /****************************************Standard stuff on screen************************************************/
        
        // Topnode
        
        let header = topHeader(textString: "Nyheter", textString2: "")
        addChild(header)
        
        
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
        
        let mailContent = inMail()
        addChild(mailContent)
        
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
}
