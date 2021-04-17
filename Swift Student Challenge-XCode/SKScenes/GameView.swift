//
//  GameView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 10/04/2021.
//

import SpriteKit


class Person: SKSpriteNode{}

class GameScene: SKScene {
    
    var previousCameraPoint = CGPoint.zero
    var isEnabled = true
    var sendTouchesToScene = true
    
    func randomPersonPosition() -> CGPoint {
        let xPosition = CGFloat.random(in: (-self.size.width/2)+20...(self.size.width)/2-20)
        let yPosition = CGFloat.random(in: (-self.size.height/2)+20...(self.size.height/2)-20)
        print("Point: \(CGPoint(x: xPosition, y: yPosition))")
        return CGPoint(x: xPosition, y: yPosition)
    }
    override func sceneDidLoad() {
        let camera = SKCameraNode()
        camera.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        scene?.camera = camera
        addChild(camera)
    }
    
    override func didMove(to view: SKView) {
        //      let panGesture = UIPanGestureRecognizer()
        //      panGesture.addTarget(self, action: #selector(panGestureAction(_:)))
        //        view.addGestureRecognizer(panGesture)
        
        let sprite = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.4, color: nil)
        addChild(sprite)
        let sprite2 = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.4, color: nil)
        addChild(sprite2)
        let sprite3 = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.4, color: nil)
        addChild(sprite3)
        let sprite4 = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.4, color: nil)
        addChild(sprite4)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        
        guard isEnabled else { return }
        
        //send touch to scene
        if sendTouchesToScene {
            super.touchesBegan(touches, with: event)
        }
        print("touched")
        //handle touches
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        print(touchLocation)
        //        let movement = SKAction.move(to: CGPoint(x: 1900, y: shot.position.y), duration: 5)
        //        let sequence = SKAction.sequence([movement, .removeFromParent()])
        //        shot.run(sequence)
        nodes(at: touchLocation)

        print(self.position)
        print(touchLocation)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch ended")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
    }
    //    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
    //      // The camera has a weak reference, so test it
    //      guard let camera = self.camera else {
    //        return
    //      }
    //      // If the movement just began, save the first camera position
    //      if sender.state == .began {
    //        previousCameraPoint = camera.position
    //      }
    //      // Perform the translation
    //      let translation = sender.translation(in: self.view)
    //      let newPosition = CGPoint(
    //        x: previousCameraPoint.x + translation.x * -1,
    //        y: previousCameraPoint.y + translation.y
    //      )
    //      camera.position = newPosition
    //        print(camera.position)
    //    }
    
}


