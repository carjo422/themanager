//
//  serie.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//


import UIKit
import SpriteKit
import Foundation

class serie: AnyObject {
    
    //var players:[playerObject]()
    
    var serieName:String
    var serieAge:Int
    var serieRank:Int
    var teams = [teamObject](repeatElement(teamObject(), count:64))
    var matches = [matchObject](repeatElement(matchObject(), count:128))
    
    init() {
        self.serieName = ""
        self.serieAge = 0
        self.serieRank = 0
        self.teams = [teamObject](repeatElement(teamObject(), count:64))
        self.matches = [matchObject](repeatElement(matchObject(), count:128))
    }
    
    func fillTeams() {
        
        self.teams.insert(teamObject(),at: 1)
        self.teams.insert(teamObject(),at: 2)
        self.teams.insert(teamObject(),at: 3)
        self.teams.insert(teamObject(),at: 4)
        self.teams.insert(teamObject(),at: 5)
        self.teams.insert(teamObject(),at: 6)
        self.teams.insert(teamObject(),at: 7)
        self.teams.insert(teamObject(),at: 8)
        
        
        self.teams[1].teamName = "IFK Göteborg"
        self.teams[2].teamName = "BK Häcken"
        self.teams[3].teamName = "BK Azalea"
        self.teams[4].teamName = "Sävedalens IK"
        self.teams[5].teamName = "Angereds IF"
        self.teams[6].teamName = "Örgryte IS"
        self.teams[7].teamName = "Utsiktens BK"
        self.teams[8].teamName = "Bernasunds IK"
        
        self.teams[1].place = 1
        self.teams[2].place = 1
        self.teams[3].place = 1
        self.teams[4].place = 1
        self.teams[5].place = 1
        self.teams[6].place = 1
        self.teams[7].place = 1
        self.teams[8].place = 1
        
        
        self.teams[1].teamColor = UIColor.blue
        self.teams[2].teamColor = UIColor.yellow
        self.teams[3].teamColor = UIColor.red
        self.teams[4].teamColor = UIColor.white
        self.teams[5].teamColor = UIColor.green
        self.teams[6].teamColor = UIColor.red
        self.teams[7].teamColor = UIColor.red
        self.teams[8].teamColor = UIColor.black
        
        self.teams[1].secColor = UIColor.blue
        self.teams[2].secColor = UIColor.black
        self.teams[3].secColor = UIColor.white
        self.teams[4].secColor = UIColor.red
        self.teams[5].secColor = UIColor.white
        self.teams[6].secColor = UIColor.blue
        self.teams[7].secColor = UIColor.white
        self.teams[8].secColor = UIColor.white
        
        self.teams[1].createPlayers()
        self.teams[2].createPlayers()
        self.teams[3].createPlayers()
        self.teams[4].createPlayers()
        self.teams[5].createPlayers()
        self.teams[6].createPlayers()
        self.teams[7].createPlayers()
        self.teams[8].createPlayers()
    }
    
    func createMatches() {
        
        var id:Int = 0
        var startDate = DateComponents(year: 2018, month: 4, day:15)
        var addDate = DateComponents(year: 0, month: 0, day: 7)
        var actDate = startDate
        var omgang = 1
        
        
        // Omgång 1
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[8]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[4]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[6]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 2
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[8]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[1]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[7]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[3]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 3
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[6]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[5]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[3]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 4
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[6]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[4]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[8]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[1]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 5
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[3]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[7]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[1]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 6
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[3]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[5]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[6]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[4]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 7
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[1]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[8]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[4]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 8
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[1]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[7]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[3]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[5]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 9
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[4]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[6]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[5]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 10
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[4]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[8]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[1]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[7]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 11
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[5]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[3]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[7]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 12
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[5]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[6]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[7]
        self.matches[id].awayTeam=teams[4]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[8]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 13
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[3]
        self.matches[id].awayTeam=teams[2]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[5]
        self.matches[id].awayTeam=teams[7]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[6]
        self.matches[id].awayTeam=teams[1]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[8]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        // Omgång 14
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[2]
        self.matches[id].awayTeam=teams[7]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[1]
        self.matches[id].awayTeam=teams[3]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[8]
        self.matches[id].awayTeam=teams[5]
        
        id=id+1
        self.matches.insert(matchObject(),at: id)
        self.matches[id].localID=id
        self.matches[id].date = actDate
        self.matches[id].omgang = omgang
        
        self.matches[id].homeTeam=teams[4]
        self.matches[id].awayTeam=teams[6]
        
        actDate.day = actDate.day! + addDate.day!
        
        omgang = omgang+1
        
        
        }
    
        func simulateRound(omgang: Int) {
        
            for i in 1...56 {
                if self.matches[i].omgang == omgang {
                    self.matches[i].homeGoal = Int(arc4random_uniform(11))
                    self.matches[i].awayGoal = Int(arc4random_uniform(10))
                    self.matches[i].matchStatus = 1
                }
            }
            
            
        }
    
    func liveTable() {
        
        for i in 1...56 {
            if self.matches[i].matchStatus == 1 {
                if self.matches[i].homeGoal > self.matches[i].awayGoal {
                    self.matches[i].homeTeam.wins = self.matches[i].homeTeam.wins + 1
                    self.matches[i].awayTeam.loss = self.matches[i].awayTeam.loss + 1
                }
                if self.matches[i].homeGoal == self.matches[i].awayGoal {
                    self.matches[i].homeTeam.draw = self.matches[i].homeTeam.draw + 1
                    self.matches[i].awayTeam.draw = self.matches[i].awayTeam.draw + 1
                }
                if self.matches[i].homeGoal < self.matches[i].awayGoal {
                    self.matches[i].homeTeam.loss = self.matches[i].homeTeam.loss + 1
                    self.matches[i].awayTeam.wins = self.matches[i].awayTeam.wins + 1
                }
                
                self.matches[i].homeTeam.gFor = self.matches[i].homeTeam.gFor + self.matches[i].homeGoal
                self.matches[i].awayTeam.gFor = self.matches[i].awayTeam.gFor + self.matches[i].awayGoal
                
                self.matches[i].homeTeam.gCon = self.matches[i].homeTeam.gCon + self.matches[i].awayGoal
                self.matches[i].awayTeam.gCon = self.matches[i].awayTeam.gCon + self.matches[i].homeGoal
            }
            
        }
        
        for i in 1...8 {
            self.teams[i].points = self.teams[i].wins*3+self.teams[i].draw
            self.teams[i].place = 0
            self.teams[i].rankScore = Double(self.teams[i].points*100000)+Double(self.teams[i].gFor-self.teams[i].gCon)+Double(self.teams[i].gFor)*0.000001
        }
        
        
        
        for j in 1...8 {
            
        var maxrank = Double(-1000)
        var setPlace = 0
        
        for i in 1...8 {
            
            if self.teams[i].rankScore > maxrank && self.teams[i].place == 0 {
                maxrank = self.teams[i].rankScore
                setPlace = i
            }
            
        }
           
        self.teams[setPlace].place = j
        
            
        }
        
        
    }
        
        
        
    }
    
    

