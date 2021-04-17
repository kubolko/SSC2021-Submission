//
//  File.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 05/04/2021.
//

import Foundation
import SpriteKit


class MainClass: ObservableObject {
    
    static let shared = MainClass()
    @Published var nameAndHobby: [String] = []
    
    func gainData(string1: String, string2: String) -> [String]{

            nameAndHobby = []
            nameAndHobby.append(string1)
            nameAndHobby.append(string2)
            print(nameAndHobby)
            
        return nameAndHobby
    }
    
    func generateperson(toView: SKView, location: CGPoint) -> SKSpriteNode {
        
        
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
        
        let container = SKNode()
        container.addChild(head)
        container.addChild(hair)
        container.addChild(eye)
        container.addChild(body)
        container.addChild(leg)
        container.addChild(shoe)
        container.addChild(nameAndHobby)
        container.addChild(intrestColor)
        
        head.position = location
        hair.position = location
        eye.position = location
        body.position = location
        leg.position = location
        shoe.position = location
        
        nameAndHobby.numberOfLines = 2
        nameAndHobby.text = "\(name) \n \(hobby)"
        
        MainClass.shared.gainData(string1: name, string2: hobby)
        
        
        nameAndHobby.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        nameAndHobby.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        nameAndHobby.name = nameAndHobby.text
        nameAndHobby.fontSize = 25
        nameAndHobby.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameAndHobby.position = CGPoint(x: location.x, y: location.y - 140)
        
        intrestColor.fillColor = UIColor(named: HobbiesString[Hobbies.firstIndex(of: hobbyType)!])!
        intrestColor.position = CGPoint(x: location.x, y: location.y - 200)
        
        if let texture = toView.texture(from: container) {
            let sprite = SKSpriteNode(texture: texture)
            sprite.position = location
            sprite.name = nameAndHobby.name
            return sprite
        }
        return container as! SKSpriteNode
    }
}
