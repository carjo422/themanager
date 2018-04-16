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
        
        for i in 1...32 {
            let createTeam = teamObject()
            createTeam.generateTeam(id: i)
        }
        
        let serie1 = serie(sName: "P13 A", sAge: 13, sRank: 1, id: 1)
        let serie2 = serie(sName: "P13 B", sAge: 13, sRank: 1, id: 2)
        let serie3 = serie(sName: "P13 C", sAge: 13, sRank: 1, id: 3)
        let serie4 = serie(sName: "P13 D", sAge: 13, sRank: 1, id: 4)
        
        
        serie1.fillTeams(idArray: [1,2,3,4,5,6,7,8])
        serie2.fillTeams(idArray: [9,10,11,12,13,14,15,16])
        serie3.fillTeams(idArray: [17,18,19,20,21,22,23,24])
        serie4.fillTeams(idArray: [25,26,27,28,29,30,31,32])
        
        serie1.createMatches()
        serie2.createMatches()
        serie3.createMatches()
        serie4.createMatches()
        
        
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
