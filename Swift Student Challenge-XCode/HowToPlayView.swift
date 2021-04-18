//
//  HowToPlayView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 03/04/2021.
//

import SwiftUI
import SpriteKit

struct HowToPlayView: View {

    @ObservedObject var personDescription = MainClass.shared
    @EnvironmentObject var viewRouter: ViewRouter

    var samplePerson: SKScene {
        let scene = SamplePersonScene()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: 250, height: 350)
        scene.scaleMode = .aspectFill
        return scene
    }
    var guidingScene1: SKScene {
        let scene = GuidingScene1()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: 250, height: 350)
        scene.scaleMode = .aspectFill
        return scene
    }
    var guidingScene2: SKScene {
        let scene = GuidingScene2()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: 800, height: 800)
        scene.scaleMode = .aspectFill
        return scene
    }
    var guidingScene4: SKScene {
        let scene = GuidingScene4()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: 800, height: 800)
        scene.scaleMode = .aspectFill
        return scene
    }
    var guidingScene5: SKScene {
        let scene = GuidingScene5()
        scene.backgroundColor = UIColor(named: "USAFABlue")!
        scene.size = CGSize(width: 800, height: 800)
        scene.scaleMode = .aspectFill
        return scene
    }

    var body: some View {
        ZStack {
            Color("USAFABlue")
                .ignoresSafeArea()
            // rain
            BackgroundSender()
            ScrollView {
                LazyVStack {
                    Group {
                        Text("Instructions")
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                        Text("Every round, there will spawn people with diffrent intrests.")
                            .font(.system(size: 36))
                            .fontWeight(.medium)
                            .frame(width: 400.0)
                        SpriteView(scene: samplePerson)
                            .frame(width: 200, height: 250)
                            .ignoresSafeArea()
                        Text("This is \(personDescription.nameAndHobby[0]). \(personDescription.nameAndHobby[0]) enjoys \(personDescription.nameAndHobby[1]). Connect him with other people who enjoy doing similar things, that will make this peron happy.")
                            .font(.system(size: 36))
                            .fontWeight(.medium)
                            .frame(width: 400.0)
                        IntrestGuide()
                        Text("Be careful! If you connect John and there’ll be other lines of diffrent intrest networks on the way you’ll lose the game.")
                            .font(.system(size: 36))
                            .fontWeight(.medium)
                            .frame(width: 400.0)
                    }
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .padding()
                        SpriteView(scene: guidingScene1)
                            .frame(width: 200, height: 250)
                            .ignoresSafeArea()
                    }
                    HStack {
                        Image(systemName: "hand.thumbsdown.fill")
                            .padding()
                        SpriteView(scene: guidingScene2)
                            .frame(width: 400, height: 450)
                            .ignoresSafeArea()
                    }
                    Text("Avoid connecting to other people network.")
                        .font(.system(size: 36))
                        .fontWeight(.medium)
                        .frame(width: 400.0)
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .padding()
                        SpriteView(scene: guidingScene4)
                            .frame(width: 400, height: 450)
                            .ignoresSafeArea()
                    }
                    Button {
                        viewRouter.selectedView = .MainMenu
                        print(viewRouter.selectedView)
                    }label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("DarkCornflower"))
                            .frame(width: 100, height: 40, alignment: .center)
                            .cornerRadius(20)

                        Text("Back to main menu")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 40, alignment: .center)
                    }
                    }.buttonStyle(PlainButtonStyle())
                    .padding()
                }
            }
        }
    }
}
struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView(personDescription: MainClass.shared).environmentObject(ViewRouter())
    }
}
