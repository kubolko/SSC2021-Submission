//
//  GuidingScene5.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 07/04/2021.
//

import SpriteKit

class GuidingScene5: SKScene {

    let SKClass = SpriteKitClass.main

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        removeAllChildren()
        let center = SpriteKitClass.main.generateperson(toView: SKView(), location: CGPoint(x: self.size.width / 2, y: self.size.height / 2), scale: 0.8, color: nil)
        addChild(center)

}
}
