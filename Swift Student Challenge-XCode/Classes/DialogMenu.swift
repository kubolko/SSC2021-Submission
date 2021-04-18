//
//  DialogMenu.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 15/04/2021.
//

import SpriteKit

class DialogMenu: SKNode{
    
    func addShadow(size: CGSize) -> SKShapeNode{
        let shadow = SKShapeNode(rectOf: size)
        shadow.fillColor = .black
        shadow.alpha = 0.3
        shadow.zPosition = 1.5
        return shadow
    }
    
    func addText() -> SKLabelNode{
        let text = SKLabelNode()
        text.text = "You just achieved next level!"
        text.fontName = "SanFranciscoText-BoldG2"
        text.fontColor = .black
        text.fontSize = 24
        text.horizontalAlignmentMode = .center
        text.zPosition = 3
        return text
    }
    
    func addBackground() -> SKShapeNode{
        let background = SKShapeNode(rect: CGRect(x: -200, y: -100, width: 400, height: 200), cornerRadius: 20)
        background.fillColor = UIColor(named: "OxfordBlue")!
        background.strokeColor = .clear
        background.zPosition = 2
        return background
    }
    
    func rectangleInside() -> SKShapeNode{
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: -35, width: 1, height: 100))
        rectangle.fillColor = .black
        rectangle.strokeColor = .clear
        rectangle.zPosition = 3
        return rectangle
    }
    
    func leftSideImage() -> SKSpriteNode{
        let spritenode = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: -118, y: -17), scale: 0.25, color: "Random")
        spritenode.zPosition = 3
        return spritenode
    }
    
    func leftSideButtonOverlap() -> SKShapeNode{
        let leftSideButtonOverlap = SKShapeNode(rect: CGRect(x: -181, y: 39, width: 150, height: 50), cornerRadius: 20)
        leftSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        leftSideButtonOverlap.strokeColor = .clear
   //     leftSideButtonOverlap.name = "LeftButton"
        leftSideButtonOverlap.zPosition = 3
        return leftSideButtonOverlap
    }
    
    func leftSideButtonLabel() -> SKLabelNode{
        let leftSideButtonLabel = SKLabelNode()
        leftSideButtonLabel.numberOfLines = 2
        leftSideButtonLabel.text = "Bring new people to \n the map with exisiting intrest"
        leftSideButtonLabel.fontName = "SanFranciscoText-BoldG2"
        leftSideButtonLabel.name = "LeftButton"
        leftSideButtonLabel.fontColor = .black
        leftSideButtonLabel.fontSize = 12
        leftSideButtonLabel.horizontalAlignmentMode = .center
        leftSideButtonLabel.preferredMaxLayoutWidth = 125
        leftSideButtonLabel.zPosition = 4
        return leftSideButtonLabel
    }
    
    func rightSideImage() -> SKShapeNode{
        let image = SKShapeNode(ellipseIn: CGRect(x: 93, y: -20, width: 34, height: 34))
        image.fillColor = UIColor(named: HobbiesString.randomElement()!)!
        image.strokeColor = .clear
        image.zPosition = 3
        return image
    }
    
    func rightSideButtonOverlap() -> SKShapeNode{
        let rightSideButtonOverlap = SKShapeNode(rect: CGRect(x: 35, y: 39, width: 150, height: 50), cornerRadius: 20)
        rightSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        rightSideButtonOverlap.strokeColor = .clear
   //     rightSideButtonOverlap.name = "RightButton"
        rightSideButtonOverlap.zPosition = 3
        return rightSideButtonOverlap
    }
    
    func rightSideButtonLabel() -> SKLabelNode{
        let rightSideButtonLabel = SKLabelNode()
        rightSideButtonLabel.text = "Bring new intrest to the \n map"
        rightSideButtonLabel.numberOfLines = 2
        rightSideButtonLabel.fontName = "SanFranciscoText-BoldG2"
        rightSideButtonLabel.name = "RightButton"
        rightSideButtonLabel.fontSize = 12
        rightSideButtonLabel.fontColor = .black
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
