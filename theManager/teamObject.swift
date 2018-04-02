//
//  teamObject.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class teamObject: AnyObject {
    
    //var players:[playerObject]()
    
    var teamName:String
    var teamColor:UIColor
    var secColor:UIColor
    var players = [playerObject](repeatElement(playerObject(), count:20))
    var place:Int
    var wins: Int
    var draw: Int
    var loss: Int
    var gFor: Int
    var gCon: Int
    var points: Int
    var rankScore: Double
    
    init() {
        
        self.teamName = ""
        self.teamColor = UIColor.black
        self.secColor = UIColor.black
        self.players = [playerObject](repeatElement(playerObject(), count:20))
        self.place = 0
        self.wins = 0
        self.draw = 0
        self.loss = 0
        self.gFor = 0
        self.gCon = 0
        self.points = 0
        self.rankScore = 0.0
        
    }
    
    func createPlayers() {
        
        for i in 1...20 {
            self.createPlayer(position: i)
        }
        
    }
    
    func createPlayer(position: Int) {
        
        
        self.players.insert(playerObject(),at: position)
        
        self.players[position].forName = generateForname()
        self.players[position].surName = generateSurname()
        
        self.players[position].age = 13
        
        self.players[position].forward = 1
        self.players[position].midfield = 0
        self.players[position].defence = 0
        self.players[position].golie = 0
        
        self.players[position].leftFoot = 1
        self.players[position].rightFoot = 0
        
        self.players[position].speed = Int(arc4random_uniform(5)+1)
        self.players[position].skill = Int(arc4random_uniform(5)+1)
        self.players[position].shot = Int(arc4random_uniform(5)+1)
        self.players[position].pass = Int(arc4random_uniform(5)+1)
        self.players[position].head = Int(arc4random_uniform(5)+1)
        self.players[position].dribble = Int(arc4random_uniform(5)+1)
        self.players[position].handling = Int(arc4random_uniform(5)+1)
        self.players[position].courage = Int(arc4random_uniform(5)+1)
        self.players[position].moral = Int(arc4random_uniform(5)+1)
        self.players[position].teamplay = Int(arc4random_uniform(5)+1)
        
    }
    
    func countTeam() -> Int {
        
        var totCount = 0
        
        for i in 1...20 {
            if self.players[i].forName != "" {
                totCount = totCount+1
            }
        }
        
        return totCount
        
    }
    
    func teamStrength() -> CGFloat {
     
        let totCount = self.countTeam()
        
        var teamStrength:CGFloat = 0
        
        for i in 1...totCount {
            teamStrength = teamStrength + CGFloat(self.players[i].speed)
            teamStrength = teamStrength + CGFloat(self.players[i].skill)
            teamStrength = teamStrength + CGFloat(self.players[i].shot)
            teamStrength = teamStrength + CGFloat(self.players[i].pass)
            teamStrength = teamStrength + CGFloat(self.players[i].head)
            teamStrength = teamStrength + CGFloat(self.players[i].dribble)
            teamStrength = teamStrength + CGFloat(self.players[i].handling)
            teamStrength = teamStrength + CGFloat(self.players[i].courage)
        }
        
        teamStrength = teamStrength / CGFloat(totCount)
        
        return teamStrength
        
    }
    
    func generateForname() -> String {
        
        let forname = ["Fredrik", "Tony", "Daniel", "Emir", "Kenny", "Johan", "Carl", "Julian", "August", "Fredrik", "Marty", "Isak", "Pascal", "Shaque"]
        let n = Int(arc4random_uniform(12))
        
        let fname = forname[n]
        
        return fname
        
    }
    func generateSurname() -> String {
        
        let surname = ["Altay", "Chopra", "Chabiuk", "Andersson", "Berggren", "Isak", "Rios", "Jonsson", "Lönn", "Kukic", "Bild", "Leboufe"]
        let n = Int(arc4random_uniform(12))
        
        let sname = surname[n]
        
        return sname
        
    }
    
}
