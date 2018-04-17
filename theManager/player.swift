//
//  player.swift
//  theManager
//
//  Created by Carl Jonsson on 2018-03-25.
//  Copyright © 2018 Carl Jonsson. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class playerObject: AnyObject {
    
    //var players:[playerObject]()
    
    var forName:String
    var surName:String
    var age:Int
    
    var id:Int
    
    var forward:Int
    var midfield:Int
    var defence:Int
    var golie:Int
    
    var position:String
    
    var leftFoot:Int
    var rightFoot:Int
    
    var speed:Int
    var skill:Int
    var shot:Int
    var pass:Int
    var head:Int
    var dribble:Int
    var handling:Int
    var courage:Int
    var teamplay:Int
    var stamina:Int
    var total:CGFloat
    var moral:Int
    var form:Int
    var luck:Int
    
    
    init() {
        
        self.forName = ""
        self.surName = ""
        
        self.age=12
        
        self.forward=1
        self.midfield=1
        self.defence=1
        self.golie=1
        
        self.position = ""
        
        if self.forward > 0 {
            self.position = self.position + "F"
        }
        if self.midfield > 0 {
            self.position = self.position + "M"
        }
        if self.defence > 0 {
            self.position = self.position + "D"
        }
        if self.golie > 0 {
            self.position = self.position + "G"
        }
        
        self.leftFoot=1
        self.rightFoot=1
        
        self.speed = 5
        self.skill = 5
        self.shot = 5
        self.pass = 5
        self.head = 5
        self.dribble = 5
        self.handling = 5
        self.courage = 5
        self.teamplay = 5
        self.stamina = 5
        
        
        self.moral = 5
        self.form = 5
        self.luck = 5
        
        self.id = 0
        
        self.total = CGFloat(self.speed+self.skill+self.shot+self.pass+self.head+self.dribble)
        
        
    }
    
    func calcTotal() -> CGFloat {
        let total = CGFloat(self.speed+self.skill+self.shot+self.pass+self.head+self.dribble+self.handling+self.courage+self.moral+self.teamplay+self.leftFoot*5+self.rightFoot*5)/10
        return total
    }
    
    func wPosition() -> String {
        
        var position = ""
        
        if self.forward > 5 {
            position = position + "F"
        }
        if self.midfield > 5 {
            position = position + "M"
        }
        if self.defence > 5 {
            position = position + "D"
        }
        if self.golie > 5 {
            position = position + "G"
        }
        return position
    }
    
    
}
