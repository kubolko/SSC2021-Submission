//
//  GuidingScene2.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 06/04/2021.
//

import SpriteKit

class GuidingScene2: SKScene {

    let SKClass = SpriteKitClass.main

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        removeAllChildren()

        let upperLeft = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 4, y: 3 * self.size.height / 4), scale: 0.8, color: "IT")

        let upperRight = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 3 * self.size.width / 4, y: 3 * self.size.height / 4), scale: 0.8, color: "Calm")

        let lowerLeft = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 4, y: self.size.height / 4), scale: 0.8, color: "Calm")

        let lowerRight = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 3 * self.size.width / 4, y: self.size.height / 4), scale: 0.8, color: "IT")

        let upperLeftLowerRightConnection = SpriteKitClass.main.drawLine(point1: upperLeft.position, point2: lowerRight.position, color: UIColor(named: upperLeft.name!)!)

        let upperRightLowerLeftConnection = SpriteKitClass.main.drawLine(point1: upperRight.position, point2: lowerLeft.position, color: UIColor(named: upperRight.name!)!)

        addChild(upperLeft)
        addChild(upperRight)
        addChild(lowerLeft)
        addChild(lowerRight)
        addChild(upperLeftLowerRightConnection)
        addChild(upperRightLowerLeftConnection)

}
}
