//
//  playerLink.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-29.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class link: SKShapeNode {
    
    var color: String!
    var type: Int!
    var link : SKLabelNode!
    var img : SKSpriteNode!
    var linkText: String!
    var bgColor: UIColor!
    var id: Int!
    var active: Int!
    var src: String!
    
    init(xD: CGFloat, yD: CGFloat, w: CGFloat, h: CGFloat, bgColor: UIColor,  linkText: String, imageName: String, src: String) {
        super.init()
        
        let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
        
        let rect = CGRect(origin: CGPoint(x: xD, y: yD), size: CGSize(width: w, height: h))
        self.path = CGPath(rect: rect, transform: nil)
        
        self.alpha = 1
        self.lineWidth = 0
        self.id = 0
        self.active = 0
        self.fillColor = bgColor
        self.lineWidth = 1
        self.isUserInteractionEnabled=true
        self.src = src
        
        
        link = SKLabelNode(text: linkText)
        
        if w > screenSize.height/10 {
        link.position = CGPoint(x: xD+screenSize.height*0.015, y: yD+h*0.35)
        link.horizontalAlignmentMode = .left
        }
        else {
            link.position = CGPoint(x: xD+w/2, y: yD+h*0.35)
            link.horizontalAlignmentMode = .center
        }
        
        
        link.fontName = "HelveticaNeue-Medium"
        link.fontSize = h*0.4
        link.text = linkText
        link.fontColor = UIColor.black
        
        self.addChild(link)
        
        if imageName != "" {
            img = SKSpriteNode(imageNamed: imageName)
            img.position = CGPoint(x: xD+w/2, y: yD+h/2)
            
            if img.size.height <= img.size.width {
                
                img.size.height = screenSize.height*0.045
                img.size.width = screenSize.height*0.045
            }
            if img.size.height >= img.size.width {
                
                img.size.height = screenSize.height*0.045
                img.size.width = screenSize.height*0.045
            }
            
    
        
            self.addChild(img)
            
        }

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*let touch = touches.first
        let touchLocation = touch!.location(in: self)*/
        
        if self.src == "" {
            
        }
            
        else {
        
            let inPart = self.src.substring(to: self.src.index(self.src.startIndex, offsetBy: 1))
            let outPart = self.src.substring(from: self.src.index(self.src.startIndex, offsetBy: 1))
        
            if inPart == "T" {
            
                GameScene.currTeam = GameScene.teams[Int(outPart)!]
                let extScene = teamView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            
            }
        
            if inPart == "S" {
            
                GameScene.currSerie = GameScene.series[Int(outPart)!]
                let extScene = serieView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            
            }
        
            if inPart == "P" {
            
                GameScene.currPlayer = GameScene.players[Int(outPart)!]
                let extScene = playerView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
                
            }
        
            /*if inPart == "M" {
            
                GameScene.currSerie = GameScene.series[Int(outPart)!-1]
                let extScene = matchView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            
            }*/
            
            if inPart == "W" {
                
                let extScene = overView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            }
            
        }
        
        
    }
    
}
