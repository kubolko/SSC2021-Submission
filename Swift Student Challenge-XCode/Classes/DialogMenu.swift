//
//  DialogMenu.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 15/04/2021.
//

import SpriteKit

class DialogMenu: SKNode{
    
    func addText() -> SKLabelNode{
        let text = SKLabelNode()
        text.text = "You just achieved next level!"
        text.fontSize = 24
        text.horizontalAlignmentMode = .center
        return text
    }
    
    func addBackground() -> SKShapeNode{
        let background = SKShapeNode(rect: CGRect(x: -200, y: -100, width: 400, height: 200), cornerRadius: 20)
        background.fillColor = UIColor(named: "USAFABlue")!
        background.zPosition = 2
        return background
    }
    
    func rectangleInside() -> SKShapeNode{
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: -35, width: 1, height: 100))
        rectangle.fillColor = .black
        rectangle.zPosition = 3
        return rectangle
    }
    
    func leftSideImage() -> SKSpriteNode{
        let spritenode = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: -118, y: -17), scale: 0.1, color: nil)
        spritenode.zPosition = 3
        return spritenode
    }
    
    func leftSideButtonOverlap() -> SKShapeNode{
        let leftSideButtonOverlap = SKShapeNode(rect: CGRect(x: -181, y: 39, width: 150, height: 50), cornerRadius: 20)
        leftSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        leftSideButtonOverlap.name = "LeftButton"
        leftSideButtonOverlap.zPosition = 3
        return leftSideButtonOverlap
    }
    
    func leftSideButtonLabel() -> SKLabelNode{
        let leftSideButtonLabel = SKLabelNode()
        leftSideButtonLabel.text = "Bring new people to the map with exisiting intrest"
        leftSideButtonLabel.name = "LeftButton"
        leftSideButtonLabel.fontSize = 12
        leftSideButtonLabel.horizontalAlignmentMode = .center
        leftSideButtonLabel.preferredMaxLayoutWidth = 125
        leftSideButtonLabel.zPosition = 4
        return leftSideButtonLabel
    }
    
    func rightSideImage() -> SKShapeNode{
        let image = SKShapeNode(ellipseIn: CGRect(x: 93, y: -20, width: 34, height: 34))
        image.fillColor = UIColor(named: HobbiesString.randomElement()!)!
        return image
    }
    
    func rightSideButtonOverlap() -> SKShapeNode{
        let rightSideButtonOverlap = SKShapeNode(rect: CGRect(x: 35, y: 39, width: 150, height: 50), cornerRadius: 20)
        rightSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        rightSideButtonOverlap.name = "RightButton"
        rightSideButtonOverlap.zPosition = 3
        return rightSideButtonOverlap
    }
    
    func rightSideButtonLabel() -> SKLabelNode{
        let rightSideButtonLabel = SKLabelNode()
        rightSideButtonLabel.text = "Bring new intrest to the map"
        rightSideButtonLabel.name = "RightButton"
        rightSideButtonLabel.fontSize = 12
        rightSideButtonLabel.horizontalAlignmentMode = .center
        rightSideButtonLabel.preferredMaxLayoutWidth = 125
        rightSideButtonLabel.zPosition = 4
        return rightSideButtonLabel
    }
    
    func setup(){
        self.addChild(addText())
        self.addChild(addBackground())
        self.addChild(rectangleInside())
        self.addChild(leftSideImage())
        self.addChild(leftSideButtonOverlap())
        self.addChild(rightSideImage())
        self.addChild(rightSideButtonOverlap())
        self.addChild(rightSideButtonLabel())
    }
    
}
