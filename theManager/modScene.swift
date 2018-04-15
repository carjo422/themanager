//
//  modScene.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-04-12.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import SpriteKit
import GameplayKit

class modScene: SKScene {
    
    
    func createGame() {
        
        let serie1 = serie(sName: "P13 A", sAge: 13, sRank: 1)
        let serie2 = serie(sName: "P13 B", sAge: 13, sRank: 1)
        let serie3 = serie(sName: "P13 C", sAge: 13, sRank: 1)
        let serie4 = serie(sName: "P13 D", sAge: 13, sRank: 1)
        
        for i in 1...32 {
            let createTeam = teamObject()
            createTeam.generateTeam(id: i)
        }
        
        serie1.fillTeams(idArray: [1,2,3,4,5,6,7,8])
        serie2.fillTeams(idArray: [9,10,11,12,13,14,15,16])
        serie3.fillTeams(idArray: [17,18,19,20,21,22,23,24])
        serie4.fillTeams(idArray: [25,26,27,28,29,30,31,32])
        
        
        GameScene.series = [serie1, serie2, serie3, serie4]
        
    }
    
    func createLink(xK:CGFloat, yK:CGFloat, w:CGFloat, h:CGFloat, bgColor: UIColor, linkText: String, image: String, id: Int, addNode: SKNode, src: String)
    {
        
        let xKa = xK*UIScreen.main.fixedCoordinateSpace.bounds.height
        let yKa = yK*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let linkW = w*UIScreen.main.fixedCoordinateSpace.bounds.height
        let linkH = h*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        
        let lnk = link(xD: xKa, yD: yKa, w: linkW, h: linkH, bgColor: bgColor, linkText: linkText, imageName: image, src: src)
        lnk.id = id
        addNode.addChild(lnk)
        
    }
    
    func moveToTeam(id: Int) -> Void {
        
        //GameScene.currTeam =
        let extScene = teamView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.resizeFill
        self.scene!.view!.presentScene(extScene)
        
    }
    
    func moveToPlayer(id: Int) -> Void {
        
        //GameScene.currTeam
        let extScene = playerView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.resizeFill
        self.scene!.view!.presentScene(extScene)
        
    }
    
    func moveToSerie(id: Int) -> Void {
        
        //GameScene.currTeam
        let extScene = serieView(size: self.scene!.size)
        extScene.scaleMode = SKSceneScaleMode.resizeFill
        self.scene!.view!.presentScene(extScene)
        
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for nods in self.children {
            
            if let test = nods as? SKNode {
            print("Fick me")
                for links in nods.children as! [link] {
                    
                }
            }
            
        }
        
    }*/
    
}
