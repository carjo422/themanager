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

class matchObject: AnyObject {
    
    //var players:[playerObject]()
    
    var homeTeam:teamObject
    var awayTeam:teamObject
    var homeGoal:Int
    var awayGoal:Int
    var matchStatus:Int
    var localID:Int
    var globalID:Int
    var date:DateComponents
    var omgang: Int
    
    init() {
        self.homeTeam = teamObject()
        self.awayTeam = teamObject()
        self.homeGoal = 0
        self.awayGoal = 0
        self.matchStatus = 0
        self.localID = 0
        self.globalID = 0
        self.date = DateComponents(year: 2018, month:4, day: 15)
        self.omgang = 0
        
    }
    
    
}


