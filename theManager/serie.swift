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
    var id:Int
    
    init(sName: String, sAge: Int, sRank: Int, id: Int) {
        self.serieName = sName
        self.serieAge = sAge
        self.serieRank = sRank
        self.id = id
        self.teams = [teamObject](repeatElement(teamObject(), count:64))
        self.matches = [matchObject](repeatElement(matchObject(), count:128))
    }
    
    func fillTeams(idArray: [Int]) -> Void {
        
        for i in 1...idArray.count {
            
            self.teams.insert(teamObject(),at: i)
            
            self.teams[i].generateTeam(id: idArray[i-1])
            self.teams[i].place=i
            self.teams[i].createPlayers()
            
        }
        
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
                if self.matches[i].omgang == omgang && self.matches[i].matchStatus == 0 {
                    self.matches[i].homeGoal = Int(arc4random_uniform(11))
                    self.matches[i].awayGoal = Int(arc4random_uniform(10))
                }
            }
            
            
        }
    
    func liveTable() {
        
        for i in 1...56 {
            if self.matches[i].matchStatus == 0 {
                self.matches[i].matchStatus = 1
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
    
    

