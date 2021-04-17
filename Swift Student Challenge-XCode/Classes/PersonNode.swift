//
//  PersonNode.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 14/04/2021.
//

import SpriteKit

class PersonNode: SKSpriteNode {

    var isEnabled = true
    var sendTouchesToScene = true
//    var touchStartPos = CGPoint.zero

    weak var after: PersonNode!

    override var isUserInteractionEnabled: Bool {
        get {
            return true
        }
        set {
            // ignore
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {

         guard isEnabled else { return }

         // send touch to scene
         if sendTouchesToScene {
            super.touchesBegan(touches, with: event)
         }
        print("touched")
         // handle touches for cat
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  print("touches moved")
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        self.position = touchLocation
        print(touchLocation)
//        let movement = SKAction.move(to: CGPoint(x: 1900, y: shot.position.y), duration: 5)
//        let sequence = SKAction.sequence([movement, .removeFromParent()])
//        shot.run(sequence)
        print(self.position)
        print(touchLocation)
        }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch ended")
        }

}
