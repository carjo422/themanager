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
    var shortName:String
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
    var id: Int
    
    init() {
        
        self.teamName = ""
        self.shortName = ""
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
        self.id = 0
        
    }
    
    func generateTeam(id: Int) {
        
        let randNumbers: [Int] = [Int(arc4random_uniform(10)),Int(arc4random_uniform(10)),Int(arc4random_uniform(10)),Int(arc4random_uniform(10))]
        
        self.id = id
        
        let startNameVector: [String] = ["Varg","Blomster","Sommar","Ätar","Vinter","Äpple","Skogs","Öken","Körsbärs","Betong"]
        let endNameVector: [String] = ["berget","berg","torp","holmen","viken","dalen","lund","borg","hög","fors"]
        let animalVector: [String] = ["Örnar","Rävar","Tordyvlar","Sorkar","Tigrar","Lejon","Älgar","Leoparder","Vargar","Hajar"]
        
        self.teamName = startNameVector[randNumbers[0]] + endNameVector[randNumbers[1]] + "s " + animalVector[randNumbers[2]]
        self.shortName = startNameVector[randNumbers[0]] + endNameVector[randNumbers[1]]
        
        if randNumbers[3] == 1 {
            self.teamColor = UIColor.blue
            self.teamColor = UIColor.white
        }
        if randNumbers[3] == 2 {
            self.teamColor = UIColor.red
            self.teamColor = UIColor.white
        }
        if randNumbers[3] == 3 {
            self.teamColor = UIColor.white
            self.teamColor = UIColor.black
        }
        if randNumbers[3] == 4 {
            self.teamColor = UIColor.yellow
            self.teamColor = UIColor.black
        }
        if randNumbers[3] == 5 {
            self.teamColor = UIColor.black
            self.teamColor = UIColor.white
        }
        if randNumbers[3] == 6 {
            self.teamColor = UIColor.green
            self.teamColor = UIColor.white
        }
        if randNumbers[3] == 7 {
            self.teamColor = UIColor.red
            self.teamColor = UIColor.black
        }
        if randNumbers[3] == 8 {
            self.teamColor = UIColor.purple
            self.teamColor = UIColor.white
        }
        if randNumbers[3] == 9 {
            self.teamColor = UIColor.white
            self.teamColor = UIColor.red
        }
        if randNumbers[3] == 10 {
            self.teamColor = UIColor.lightGray
            self.teamColor = UIColor.black
        }
        

        GameScene.teams.insert(self, at: id)
        
        
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
        
        if position < 3 {
            self.players[position].golie = 5+Int(arc4random_uniform(5)+1)
            self.players[position].forward = Int(arc4random_uniform(4)+1)
            self.players[position].midfield = Int(arc4random_uniform(4)+1)
            self.players[position].defence = Int(arc4random_uniform(4)+1)
        }
        else {
        
        self.players[position].golie = Int(arc4random_uniform(3)+1)
        self.players[position].forward = Int(arc4random_uniform(9)+1)
        self.players[position].midfield = Int(arc4random_uniform(9)+1)
        self.players[position].defence = Int(arc4random_uniform(9)+1)
            
        for _ in 1...5 {
                if max(self.players[position].golie,self.players[position].forward,self.players[position].midfield,self.players[position].defence) < 6 {
                    self.players[position].golie = self.players[position].golie + 1
                    self.players[position].forward = self.players[position].forward + 1
                    self.players[position].midfield = self.players[position].midfield + 1
                    self.players[position].defence = self.players[position].defence + 1
                }
            }
            
        }
        
        self.players[position].leftFoot = Int(arc4random_uniform(1))
        self.players[position].rightFoot = Int(arc4random_uniform(1))
        
        self.players[position].position = self.players[position].wPosition()
        
        self.players[position].speed = Int(arc4random_uniform(5)+1)
        self.players[position].skill = Int(arc4random_uniform(5)+1)
        self.players[position].shot = Int(arc4random_uniform(5)+1)
        self.players[position].pass = Int(arc4random_uniform(5)+1)
        self.players[position].head = Int(arc4random_uniform(5)+1)
        self.players[position].dribble = Int(arc4random_uniform(5)+1)
        self.players[position].handling = Int(arc4random_uniform(5)+1)
        self.players[position].courage = Int(arc4random_uniform(5)+1)
        self.players[position].teamplay = Int(arc4random_uniform(5)+1)
        
        
        self.players[position].moral = Int(arc4random_uniform(10)+1)
        self.players[position].form = Int(arc4random_uniform(2))+Int(arc4random_uniform(2))+Int(arc4random_uniform(2))+Int(arc4random_uniform(2))+Int(arc4random_uniform(2))
        self.players[position].luck = Int(arc4random_uniform(10)+1)
        
        
        self.players[position].id = GameScene.players.count
        
        self.players[position].total = self.players[position].calcTotal()
        
        GameScene.players.insert(self.players[position], at: GameScene.players.count)
        
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
