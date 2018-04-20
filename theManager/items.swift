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
            link.position = CGPoint(x: xD+w/2, y: yD+h*0.3)
            link.horizontalAlignmentMode = .center
        }
        
        
        link.fontName = "HelveticaNeue-Medium"
        link.fontSize = h*0.5
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
        
        
            if inPart == "W" {
                
                let extScene = overView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            }
            
            if inPart == "N" {
                
                let extScene = newsView(size: self.scene!.size)
                extScene.scaleMode = SKSceneScaleMode.resizeFill
                self.scene!.view!.presentScene(extScene)
            }
            
        }
        
        
    }
    
}


class ilink: SKShapeNode {
    
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
        self.src = src
        
        
        link = SKLabelNode(text: linkText)
        
        if w > screenSize.height/10 {
            link.position = CGPoint(x: xD+screenSize.height*0.015, y: yD+h*0.3)
            link.horizontalAlignmentMode = .left
        }
        else {
            link.position = CGPoint(x: xD+w/2, y: yD+h*0.35)
            link.horizontalAlignmentMode = .center
        }
        
        
        link.fontName = "HelveticaNeue-Medium"
        link.fontSize = h*0.5
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
    
    
    
}

class rollMeter: SKShapeNode {
    
    var desc: SKLabelNode
    var meterLeft: SKShapeNode
    var meterRight: SKShapeNode
    var circleNode: SKShapeNode
    var rect3: SKSpriteNode
    
    var old_location: CGFloat
    var moved_dist: CGFloat
    
    var fingDown = 0
    
    var length: CGFloat
    var girth: CGFloat
    var steps: CGFloat
    var endPos: CGFloat
    
    var altVector: [String]
    
    var descValue: SKLabelNode
    
    var maxValue: Int
    
    var initValue: Int
    
    
    init(descText: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, altVector: [String]) {
        
        
        
        let rect1 = CGRect(x: x, y: y, width: width, height: height)
        let rect2 = CGRect(x: x+width*0.975, y: y, width: width*0.025, height: height)
        let clipPath1: CGPath = UIBezierPath(roundedRect: rect1, cornerRadius: height*0.10).cgPath
        let clipPath2: CGPath = UIBezierPath(roundedRect: rect2, cornerRadius: height*0.10).cgPath
        
        let circle = CGRect(x: x+width/2-height*0.275, y: y-0.2*height, width: height*1.4, height: height*1.4)
        let circlePath: CGPath = UIBezierPath(roundedRect: circle, cornerRadius: height*0.7).cgPath
        
        
        self.desc = SKLabelNode(text: descText)
        self.desc.text = descText
        self.desc.position = CGPoint(x: x, y: y+height*1.3)
        self.desc.horizontalAlignmentMode = .left
        self.desc.fontSize = height*0.75
        self.desc.fontName = "HelveticaNeue-Medium"
        
        self.descValue = SKLabelNode(text: "5/10")
        self.descValue.position = CGPoint(x: x+width, y: y+height*1.3)
        self.descValue.horizontalAlignmentMode = .right
        self.descValue.fontSize = height*0.75
        self.descValue.fontName = "HelveticaNeue-Medium"
        
        
        self.meterLeft = SKShapeNode(path: clipPath1)
        self.meterLeft.fillColor=UIColor.gray
        self.meterLeft.zPosition = 4
        
        self.meterRight = SKShapeNode(path: clipPath2)
        self.meterRight.fillColor=UIColor.green
        self.meterRight.zPosition = 4
        
        self.circleNode = SKShapeNode(path: circlePath)
        self.circleNode.zPosition = 10
        self.circleNode.fillColor = UIColor.darkGray
        
        self.old_location = 0
        self.moved_dist = 0
        
        self.altVector = altVector
        self.maxValue = altVector.count
        
        
        self.rect3 = SKSpriteNode(imageNamed: "green")
        self.rect3.anchorPoint = CGPoint(x: 0,y: 0)
        self.rect3.position.x = x+width/2-height*0.1
        self.rect3.position.y = y
        self.rect3.size.height = height
        self.rect3.size.width = width*0.49
        self.rect3.zPosition = 6
        
        self.length = width
        self.girth = height
        self.steps = CGFloat(altVector.count-1)
        self.endPos = 0
        self.initValue = 0
        
        super.init()
    
        self.isUserInteractionEnabled=true
        
        self.addChild(meterLeft)
        self.addChild(meterRight)
        self.addChild(rect3)
        self.addChild(circleNode)
        self.addChild(desc)
        self.addChild(descValue)
        
        let delta = CGFloat(self.initValue)/CGFloat(self.maxValue)*length
        
        let endPos = self.meterLeft.position.x-self.length/2-self.girth/2+delta
        
        self.rect3.position.x = self.rect3.position.x + (endPos-self.circleNode.position.x)
        self.rect3.size.width = self.rect3.size.width - (endPos-self.circleNode.position.x)
        self.circleNode.position.x = endPos
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        old_location = touchLocation.x
        
        if self.circleNode.contains(touchLocation) {
            fingDown = 1
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        
        moved_dist = touchLocation.x-old_location
        old_location = touchLocation.x
        
        if fingDown == 1 {
            
            if touchLocation.x-self.desc.position.x < self.meterLeft.position.x-girth {
                if moved_dist > 0 {
                    moved_dist = 0
                }
                else {
                    moved_dist=moved_dist*2
                }
            }
            if touchLocation.x-self.desc.position.x > self.meterLeft.position.x + length+girth {
                if moved_dist < 0 {
                    moved_dist = 0
                }
                else {
                    moved_dist=moved_dist*2
                }
            }
            
            self.circleNode.position.x = self.circleNode.position.x+moved_dist
            
            if self.circleNode.position.x < self.meterLeft.position.x-self.length/2-self.girth/2 {
                moved_dist = moved_dist - (self.circleNode.position.x-self.meterLeft.position.x+self.length/2+self.girth/2)
                self.circleNode.position.x = self.meterLeft.position.x-self.length/2-self.girth/2
                
            }
            else if self.circleNode.position.x > self.meterLeft.position.x+self.length/2-self.girth/2 {
                moved_dist = moved_dist + (-self.circleNode.position.x+self.meterLeft.position.x+self.length/2-self.girth/2)
                self.circleNode.position.x = self.meterLeft.position.x+self.length/2-self.girth/2
            }
            else {
                
                let percentMoved = (self.circleNode.position.x-(self.meterLeft.position.x-self.length/2-self.girth/2))/length
                var percentNew = CGFloat(Int((percentMoved+1/steps/2)*(steps)))/steps
                
                var whatStep = percentNew*steps
                
                if whatStep > CGFloat(maxValue) {
                    whatStep = CGFloat(maxValue)
                }
                
                percentNew = whatStep/steps
                
                
                self.descValue.text = self.altVector[Int(whatStep)]
                self.initValue = Int(whatStep)
                
                
                endPos = self.meterLeft.position.x-self.length/2-self.girth/2+percentNew*length
                
            }
            
            self.rect3.position.x = self.rect3.position.x+moved_dist
            self.rect3.size.width = self.rect3.size.width-moved_dist
            
            
            
            
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        fingDown = 0
        
        
        self.rect3.position.x = self.rect3.position.x + (endPos-self.circleNode.position.x)
        self.rect3.size.width = self.rect3.size.width - (endPos-self.circleNode.position.x)
        self.circleNode.position.x = endPos
        
    }
    
}

class textField: SKLabelNode {
    
    init(text: String) {
        
        super.init()
        
        self.text = text
        self.fontSize = UIScreen.main.fixedCoordinateSpace.bounds.height*CGFloat(0.03)
        self.horizontalAlignmentMode = .left
        self.fontName = "HelveticaNeue-Medium"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class inMail: SKShapeNode {
    
    override init() {
        
        let screenSize = UIScreen.main.fixedCoordinateSpace.bounds
        let rect1 = CGRect(x: screenSize.height*0.015, y: screenSize.height*0.075, width: screenSize.height*0.52, height: screenSize.height*0.5)
        let rect2 = CGRect(x: screenSize.height*0.015, y: screenSize.height*0.595, width: screenSize.height*0.52, height: 1)
        let clipPath1: CGPath = UIBezierPath(roundedRect: rect1, cornerRadius: screenSize.height*0.0025).cgPath
        let strokePath: CGPath = UIBezierPath(roundedRect: rect2, cornerRadius:0).cgPath
        
        let image = SKSpriteNode(imageNamed: "face")
        image.anchorPoint = CGPoint(x: 0,y: 0)
        image.size = CGSize(width: screenSize.height*0.12, height: screenSize.height*0.12)
        image.position = CGPoint(x: screenSize.height*0.025, y: screenSize.height*0.425)
        
        let stroke = SKShapeNode()
        stroke.path=strokePath
        stroke.strokeColor = UIColor.black
        
        super.init()
        
        self.path = clipPath1
        self.addChild(stroke)
        
        self.addChild(image)
        
        self.strokeColor = UIColor(red: 0.06, green: 0.1, blue: 0.3, alpha: 0)
        self.fillColor = UIColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 0)
        self.lineWidth = 1
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

