//
//  GeneratePerson.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 03/04/2021.
//

import SpriteKit
import UIKit
import Combine

class SamplePersonScene: SKScene {

    let SKClass = SpriteKitClass.main

    override func didMove(to: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        removeAllChildren()
        addChild(SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 2, y: self.size.height / 2), scale: 0.8, color: "Random"))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAllChildren()
        addChild(SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 2, y: self.size.height / 2), scale: 0.8, color: "Random"))
        print("added child")
    }
}
