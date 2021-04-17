////
////  NextLevelScene.swift
////  Swift Student Challenge-XCode
////
////  Created by Jakub Sumionka on 15/04/2021.
////
//
//import SpriteKit
//
//class LevelChoose: SKScene {
//
//  var center : CGPoint?
//  var pauseButton: SKSpriteNode?
//  var endGameButton: SKSpriteNode?
//  var parentViewController: CustomViewController?
//
//  override func didMove(to view: SKView) {
//    setUpScene()
//  }
//
//  func setUpScene() {
//    self.backgroundColor = SKColor.white
//    self.center = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
//    self.isUserInteractionEnabled = false
//
//    setUpSceneNodes()
//    showPauseEndButtons()
//
//  } // end setup scene
//
//  func setUpSceneNodes() {
//    let buttonScale: CGFloat = 0.5
//    let smallButtonScale: CGFloat = 0.25
//
//    let pauseOffset = //some CGPoint
//    let endGameOffset = //some CGPoint
//    pauseButton = SKSpriteNode(imageNamed: PauseNames.pausedButton)
//    pauseButton?.name = PauseNames.pausedButton
//    pauseButton?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//    pauseButton?.position = self.center! + pauseOffset
//    pauseButton?.alpha = 0
//    pauseButton?.setScale(buttonScale)
//
//    endGameButton = SKSpriteNode(imageNamed: PauseNames.endGameButton)
//    endGameButton?.name = PauseNames.pausedButton
//    endGameButton?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//    endGameButton?.position = self.center! + endGameOffset
//    endGameButton?.alpha = 0
//    endGameButton?.setScale(smallButtonScale)
//  }
//
//  func showPauseEndButtons() {
//    let buttonFadeInTime = 0.25
//    let pauseDelay = 1.0
//
//    self.addChild(pauseButton!)
//    self.addChild(endGameButton!)
//
//    pauseButton?.run(SKAction.fadeIn(withDuration: buttonFadeInTime))
//    endGameButton?.run(SKAction.fadeIn(withDuration: buttonFadeInTime))
//    self.run(SKAction.sequence([
//      SKAction.wait(forDuration: pauseDelay),
//      SKAction.run{ self.isUserInteractionEnabled = true }]))
//  }
//
//  func endGamePressed() {
//    // add confrim logic
//    parentViewController?.endGame()
//  }
//
//  func unpausePress() {
//    parentViewController?.unpauseGame()
//  }
//
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for touch in touches {
//      let touchLocation = touch.location(in: self)
//
//      if endGameButton!.contains(touchLocation) {
//        endGamePressed()
//        return
//      }
//      else {
//        unpausePress()
//      }
//
//    } // end for each touch
//  } // end touchesBegan
//
//  override func update(_ currentTime: TimeInterval) {
//    /* Called before each frame is rendered */
//  }
//
//} //
