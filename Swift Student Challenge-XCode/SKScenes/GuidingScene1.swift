//
//  GuidingScene.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 06/04/2021.
//

import SpriteKit

// TODO: Zmniejszyć czcionkę i wgl ją ogarnąć

class GuidingScene1: SKScene {

    let SKClass = SpriteKitClass.main

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        removeAllChildren()
        let left = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 4, y: self.size.height / 2), scale: 0.8, color: "IT")
        let right = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width * 3 / 4, y: self.size.height / 2), scale: 0.8, color: "IT")
        let connection = SpriteKitClass.main.drawLine(point1: left.position, point2: right.position, color: UIColor(named: left.name!)!)

        addChild(left)
        addChild(right)
        addChild(connection)

    }
}
