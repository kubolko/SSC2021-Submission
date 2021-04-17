//
//  GameViewWrapper.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 10/04/2021.
//

import SwiftUI
import SpriteKit

struct GameViewWrapper: View {

    var GameView: SKScene {
        let scene = GameScene()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        scene.scaleMode = .aspectFit
        return scene
    }

    var body: some View {
        SpriteView(scene: GameView)
            .ignoresSafeArea()
    }
}

struct GameViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        GameViewWrapper()
    }
}
