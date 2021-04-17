//
//  GuidingScene4.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 07/04/2021.
//

import SpriteKit

class GuidingScene4: SKScene {

    let SKClass = SpriteKitClass.main

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        removeAllChildren()

        let x2y4 = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 2 * self.size.width / 5, y: 4 * self.size.height / 5), scale: 0.8, color: "IT")

        let x3y3 = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 3 * self.size.width / 5, y: 3 * self.size.height / 5), scale: 0.8, color: "IT")

        let x1y2 = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 5, y: 2 * self.size.height / 5), scale: 0.8, color: "Calm")

        // Person
        // let x5y1 = SpriteKitClass.main.generateperson(toView: SKView(), location:  CGPoint(x: 4.5 * self.size.width / 5, y: self.size.height / 5), scale: 0.8)
        let person = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 4.25 * self.size.width / 5, y: self.size.height / 5), scale: 0.8, color: "Calm")

        // TODO: to miał być kurwa serwer- ✅

        let x4y4 = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: 4 * self.size.width / 5, y: 4 * self.size.height / 5), scale: 0.8, color: "Calm")

        let x2y4tox3y3 = SpriteKitClass.main.drawLine(point1: x2y4.position, point2: x3y3.position, color: UIColor(named: x2y4.name!)!)

        let x1y2toperson = SpriteKitClass.main.drawLine(point1: x1y2.position, point2: person.position, color: UIColor(named: x1y2.name!)!)

        let x4y4toperson = SpriteKitClass.main.drawLine(point1: x4y4.position, point2: person.position, color: UIColor(named: x4y4.name!)!)

        addChild(x2y4)
        addChild(x3y3)
        addChild(x1y2)
        addChild(x4y4)
        addChild(person)
        addChild(x2y4tox3y3)
        addChild(x1y2toperson)
        addChild(x4y4toperson)

}
}
