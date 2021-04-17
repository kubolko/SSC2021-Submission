//
//  GuidingScene.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 06/04/2021.
//

import SpriteKit

//TODO: Zmniejszyć czcionkę i wgl ją ogarnąć

class GuidingScene1: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        removeAllChildren()
        //        addChild(generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 4, y: self.size.height / 2), scale: 0.8)
        //        )
        //        addChild(generateperson(toView: SKView(), location: CGPoint(x: self.size.width * 3 / 4, y: self.size.height / 2), scale: 0.8)
        //        )
        //        drawConnection(point1: CGPoint(x: self.size.width * 3 / 4, y: self.size.height / 2), point2: CGPoint(x: self.size.width / 4, y: self.size.height / 2), color: .white, score: "+1")
        let left = generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 4, y: self.size.height / 2), scale: 0.8)
        let right = generateperson(toView: SKView(), location: CGPoint(x: self.size.width * 3 / 4, y: self.size.height / 2), scale: 0.8)
        let pointsdisplay = drawConnection(point1: CGPoint(x: self.size.width * 3 / 4, y: (self.size.height + 50) / 2 ), point2: CGPoint(x: self.size.width / 4, y: (self.size.height + 50) / 2), color: UIColor(named: left.name!)!, score: "+1")
        let connection = drawLine(point1: CGPoint(x: self.size.width * 3 / 4, y: (self.size.height + 50) / 2), point2: CGPoint(x: self.size.width / 4, y: (self.size.height + 50) / 2), color: UIColor(named: left.name!)!)
        
        addChild(left)
        addChild(right)
        addChild(connection)
        addChild(pointsdisplay)
        
        
        
        //drawLine(point1: CGPoint(x: self.size.width * 3 / 4, y: self.size.height / 2), point2: CGPoint(x: self.size.width / 4, y: self.size.height / 2), color: .red)
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        removeAllChildren()
    //        addChild(generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 2, y: self.size.height / 2), scale: 0.8))
    //        print("added child")
    //    }
    
    
    func drawConnection(point1: CGPoint, point2: CGPoint, color: UIColor, score: String) -> SKLabelNode{
        var label = SKLabelNode(text: score)
        label.fontColor = color
        label.position = CGPoint(x: (point2.x+point1.x)/2, y: (point2.y+point1.y)/2)
//        drawLine(point1: point1, point2: point2, color: color)
        return label
    }
    
    func drawLine(point1: CGPoint, point2: CGPoint, color: UIColor) -> SKShapeNode{
        
        var yourline = SKShapeNode()
        var pathToDraw = CGMutablePath()
        pathToDraw.move(to: point1)
        pathToDraw.addLine(to: point2)
        yourline.path = pathToDraw
        yourline.strokeColor = color
        return yourline
    }
    
    func generateperson(toView: SKView, location: CGPoint, scale: CGFloat) -> SKSpriteNode {
        
        
        let name = randomnames.randomElement()!
        let hobbyType = Hobbies.randomElement()!
        let hobby = hobbyType.randomElement()!
        
        
        let head = SKSpriteNode(imageNamed: "Head\(Int.random(in: 1...5))")
        let hair = SKSpriteNode(imageNamed: "Hair\(Int.random(in: 1...5))")
        let eye = SKSpriteNode(imageNamed: "Eyes\(Int.random(in: 1...5))")
        let body = SKSpriteNode(imageNamed: "Body\(Int.random(in: 1...5))")
        let leg = SKSpriteNode(imageNamed: "Leg\(Int.random(in: 1...5))")
        let shoe = SKSpriteNode(imageNamed: "Shoes\(Int.random(in: 1...5))")
        let nameAndHobby = SKLabelNode(fontNamed: "SFProDisplay-Medium")
        let intrestColor = SKShapeNode(circleOfRadius: 20)
        let connection = UIImage(systemName: "wifi")
        let connectionColored = connection!.withColor(UIColor(named: HobbiesString[Hobbies.firstIndex(of: hobbyType)!])!)
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
        nameAndHobby.text = "\(name) \n \(hobby)"
        
        //TODO: Naprawić to gówno
        //    MainClass.shared.gainData(string1: name, string2: hobby)
        
        
        nameAndHobby.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        nameAndHobby.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        nameAndHobby.name = nameAndHobby.text
        nameAndHobby.fontSize = 25
        nameAndHobby.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameAndHobby.position = CGPoint(x: location.x, y: location.y - 140)
        
        intrestColor.fillColor = UIColor(named: HobbiesString[Hobbies.firstIndex(of: hobbyType)!])!
        intrestColor.position = CGPoint(x: location.x, y: location.y - 200)
        
        connectionSKNode.size = CGSize(width: 64, height: 64)
        connectionSKNode.position = CGPoint(x: location.x, y: location.y + 110)
        
        
        if let texture = toView.texture(from: container) {
            let sprite = SKSpriteNode(texture: texture)
            sprite.position = location
            sprite.zPosition = 1
            sprite.setScale(scale)
            sprite.name = HobbiesString[Hobbies.firstIndex(of: hobbyType)!]
            return sprite
        }
        return container as! SKSpriteNode
    }
}
