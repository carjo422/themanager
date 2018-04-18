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
    
    var altColor = UIColor.darkGray
    
    func createGame() {
        
        for i in 0...31 {
            let createTeam = teamObject()
            createTeam.generateTeam(id: i)
        }
        
        let serie1 = serie(sName: "P13 A", sAge: 13, sRank: 1, id: 0)
        let serie2 = serie(sName: "P13 B", sAge: 13, sRank: 1, id: 1)
        let serie3 = serie(sName: "P13 C", sAge: 13, sRank: 1, id: 2)
        let serie4 = serie(sName: "P13 D", sAge: 13, sRank: 1, id: 3)
        
        
        serie1.fillTeams(idArray: [0,1,2,3,4,5,6,7])
        serie2.fillTeams(idArray: [8,9,10,11,12,13,14,15])
        serie3.fillTeams(idArray: [16,17,18,19,20,21,22,23])
        serie4.fillTeams(idArray: [24,25,26,27,28,29,30,31])
        
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
    
    func createLinkIntern(xK:CGFloat, yK:CGFloat, w:CGFloat, h:CGFloat, bgColor: UIColor, linkText: String, image: String, id: Int, addNode: SKNode, src: String)
    {
        
        let xKa = xK*UIScreen.main.fixedCoordinateSpace.bounds.height
        let yKa = yK*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        let linkW = w*UIScreen.main.fixedCoordinateSpace.bounds.height
        let linkH = h*UIScreen.main.fixedCoordinateSpace.bounds.height
        
        
        let lnk = ilink(xD: xKa, yD: yKa, w: linkW, h: linkH, bgColor: bgColor, linkText: linkText, imageName: image, src: src)
        lnk.id = id
        addNode.addChild(lnk)
        
    }
    
    func calc_string(inString: String) -> Double {
        
        var inString_new = inString.replacingOccurrences(of: " ", with: "").lowercased()
        
        var output = Double(0)
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","x","y","z","å","ä","ö"]
        
        var it = Double(100)
        
        for char in inString_new.characters {
            
            let charNum = alphabet.index(of: String(describing: char))!
            
            it = it/100
            
            output = output + Double(charNum)*it
            
        }
        
        return output
        
    }
    
    func calc_pos(player: playerObject) -> Int {
        
        var output = 1
        
        let posA = player.golie
        let posB = player.defence
        let posC = player.midfield
        let posD = player.forward
        
        let maxAtt = max(posA,posB,posC,posD)
        
        if maxAtt == player.forward { output = 4 }
        if maxAtt == player.midfield { output = 3 }
        if maxAtt == player.defence { output = 2 }
        if maxAtt == player.golie { output = 1 }
        
        return output
        
    }

    
}
