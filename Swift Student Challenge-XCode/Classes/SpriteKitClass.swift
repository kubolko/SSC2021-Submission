//
//  SpriteKitClass.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 06/04/2021.
//

import SpriteKit

class SpriteKitClass {
    
    static let main = SpriteKitClass()
    

    func generateperson(toView: SKView, location: CGPoint, scale: CGFloat, color: String) -> SKSpriteNode {
    
        let name = randomnames.randomElement()!
        var unwrappedColor : String
        if color == "Random"{
            unwrappedColor = HobbiesString.randomElement()!
        }
        else{
            unwrappedColor = color 
        }
        let hobby = Hobbies[HobbiesString.firstIndex(of: unwrappedColor)!].randomElement()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 64, weight: .medium, scale: .default)
        
        let head = SKSpriteNode(imageNamed: "Head\(Int.random(in: 1...5))")
        let hair = SKSpriteNode(imageNamed: "Hair\(Int.random(in: 1...5))")
        let eye = SKSpriteNode(imageNamed: "Eyes\(Int.random(in: 1...5))")
        let body = SKSpriteNode(imageNamed: "Body\(Int.random(in: 1...5))")
        let leg = SKSpriteNode(imageNamed: "Leg\(Int.random(in: 1...5))")
        let shoe = SKSpriteNode(imageNamed: "Shoes\(Int.random(in: 1...5))")
        let nameAndHobby = SKLabelNode(fontNamed: "SFProDisplay-Medium")
        let intrestColor = SKShapeNode(circleOfRadius: 20)
        let connection = UIImage(systemName: "wifi", withConfiguration: largeConfig)
        let connectionColored = connection!.withColor(UIColor(named: unwrappedColor)!)
        let connectionTexture = SKTexture(image: connectionColored)
        let connectionSKNode = SKSpriteNode(texture: connectionTexture)
        
        let container = SKNode()
        container.addChild(head)
        container.addChild(hair)
        container.addChild(eye)
        container.addChild(body)
        container.addChild(leg)
        container.addChild(shoe)
        container.addChild(nameAndHobby)
        container.addChild(intrestColor)
        container.addChild(connectionSKNode)
        
        head.position = location
        hair.position = location
        eye.position = location
        body.position = location
        leg.position = location
        shoe.position = location
        
        nameAndHobby.numberOfLines = 2
        nameAndHobby.text = "\(name) \n \(String(hobby!))"
        
        // TODO: Naprawić to gówno
        //    MainClass.shared.gainData(string1: name, string2: hobby)
        
        nameAndHobby.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        nameAndHobby.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
//        nameAndHobby.name = nameAndHobby.text
        nameAndHobby.fontSize = 25
        nameAndHobby.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameAndHobby.position = CGPoint(x: location.x, y: location.y - 140)
        
        intrestColor.fillColor = UIColor(named: unwrappedColor)!
        intrestColor.position = CGPoint(x: location.x, y: location.y - 200)
        
        connectionSKNode.position = CGPoint(x: location.x, y: location.y + 110)
        
        if let texture = toView.texture(from: container) {
            let sprite = SKSpriteNode(texture: texture)
            sprite.position = location
            sprite.zPosition = 1
            sprite.setScale(scale)
            sprite.name = unwrappedColor
            return sprite
        }
        return container as! SKSpriteNode
    }
    
    func drawConnection(point1: CGPoint, point2: CGPoint, color: UIColor, score: String) -> SKLabelNode {
        let label = SKLabelNode(text: score)
        label.fontColor = color
        label.position = CGPoint(x: (point2.x+point1.x)/2, y: (point2.y+point1.y)/2)
        //        drawLine(point1: point1, point2: point2, color: color)
        return label
    }
    
    func drawLine(point1: CGPoint, point2: CGPoint, color: UIColor) -> SKShapeNode {
        
        let yourline = SKShapeNode()
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: point1)
        pathToDraw.addLine(to: point2)
        yourline.path = pathToDraw
        yourline.lineWidth = 1
        yourline.strokeColor = color
        return yourline
    }
    
    func generateServer(color: UIColor) -> SKSpriteNode {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 64, weight: .medium, scale: .default)
        let serverIcon = UIImage(systemName: "antenna.radiowaves.left.and.right", withConfiguration: largeConfig)
        let serverIconColored = serverIcon!.withColor(color)
        let serverTexture = SKTexture(image: serverIconColored)
        let serverSKNode = SKSpriteNode(texture: serverTexture)
        
        return serverSKNode
    }
    func generatePopUpMenu() -> [SKNode]{
        var arr = [SKNode]()
        let text = SKLabelNode()
        text.text = "You just achieved next level!"
        text.fontSize = 24
        text.horizontalAlignmentMode = .center
        arr.append(text)
        
        let background = SKShapeNode(rect: CGRect(x: -200, y: -100, width: 400, height: 200), cornerRadius: 20)
        background.fillColor = UIColor(named: "USAFABlue")!
        background.zPosition = 2
        arr.append(background)
        
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: -35, width: 1, height: 100))
        rectangle.fillColor = .black
        rectangle.zPosition = 3
        arr.append(rectangle)
        
        let spritenode = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: -118, y: -17), scale: 0.1, color: "Random")
        spritenode.zPosition = 3
        arr.append(spritenode)
        let leftSideButtonOverlap = SKShapeNode(rect: CGRect(x: -181, y: 39, width: 150, height: 50), cornerRadius: 20)
        leftSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        leftSideButtonOverlap.name = "LeftButton"
        leftSideButtonOverlap.zPosition = 3
        arr.append(leftSideButtonOverlap)
        
        let leftSideButtonLabel = SKLabelNode()
        leftSideButtonLabel.text = "Bring new people to the map with exisiting intrest"
        leftSideButtonLabel.name = "LeftButton"
        leftSideButtonLabel.fontSize = 12
        leftSideButtonLabel.horizontalAlignmentMode = .center
        leftSideButtonLabel.preferredMaxLayoutWidth = 125
        leftSideButtonLabel.zPosition = 4
        arr.append(leftSideButtonLabel)
        
        let image = SKShapeNode(ellipseIn: CGRect(x: 93, y: -20, width: 34, height: 34))
        image.fillColor = UIColor(named: HobbiesString.randomElement()!)!
        arr.append(image)
        let rightSideButtonOverlap = SKShapeNode(rect: CGRect(x: 35, y: 39, width: 150, height: 50), cornerRadius: 20)
        rightSideButtonOverlap.fillColor = UIColor(named: "RomanSilver")!
        rightSideButtonOverlap.name = "RightButton"
        rightSideButtonOverlap.zPosition = 3
        arr.append(rightSideButtonOverlap)
        let rightSideButtonLabel = SKLabelNode()
        rightSideButtonLabel.text = "Bring new intrest to the map"
        rightSideButtonLabel.name = "RightButton"
        rightSideButtonLabel.fontSize = 12
        rightSideButtonLabel.horizontalAlignmentMode = .center
        rightSideButtonLabel.preferredMaxLayoutWidth = 125
        rightSideButtonLabel.zPosition = 4
        arr.append(rightSideButtonLabel)
        
        return arr
    }
    
}
