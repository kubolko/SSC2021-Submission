//
//  ContentView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 03/04/2021.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    
    func playSounds(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }

    enum SwipeHorizontalDirection: String {
        case left, right, none
    }

    @EnvironmentObject var viewRouter: ViewRouter

    @State var swipeHorizontalDirection: SwipeHorizontalDirection = .none { didSet { print(swipeHorizontalDirection) } }
    let gradient = Gradient(colors: [Color("BlackCoral"), Color("USAFABlue")])

    var body: some View {
        ZStack {
            switch viewRouter.selectedView {
            case .MainMenu:
            LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
                BackgroundSender()
            case .HowToPlayView:
                Color("USAFABlue")
                    .ignoresSafeArea()
               // BackgroundSender()
            case .GameIntroduction1:
                Color("BlackCoral")
                    .ignoresSafeArea()
              //  BackgroundSender()
            case .GameIntroduction2:
                Color("BlackCoral")
                    .ignoresSafeArea()
               // BackgroundSender()
            case .GameIntroduction3:
                Color("BlackCoral")
                    .ignoresSafeArea()
//                BackgroundSender()
            case .GameView:
                Color("BlackCoral")
                    .ignoresSafeArea()
                BackgroundSender()
            }
            VStack {
                switch viewRouter.selectedView {
                case .MainMenu:
                    MainMenuView()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: AnyTransition.move(edge: .leading)))
                        .animation(Animation.linear)
                        .gesture(
                            DragGesture(minimumDistance: 100)
                                .onChanged {
                                    if $0.startLocation.x > $0.location.x {
                                        self.swipeHorizontalDirection = .left
                                        viewRouter.selectedView = .GameIntroduction1
                                        print(viewRouter.selectedView)
                                    } else if $0.startLocation.x == $0.location.x {
                                        self.swipeHorizontalDirection = .none
                                    } else {
                                        self.swipeHorizontalDirection = .right
                                        viewRouter.selectedView = .HowToPlayView
                                        print(viewRouter.selectedView)
                                    }
                                }
                        )
                case .HowToPlayView:
                    HowToPlayView()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .leading), removal: AnyTransition.move(edge: .trailing)))
                        .animation(Animation.linear)
                        .gesture(
                            DragGesture(minimumDistance: 100)
                                .onChanged {
                                    if $0.startLocation.x > $0.location.x {
                                        self.swipeHorizontalDirection = .left
                                        viewRouter.selectedView = .MainMenu
                                        print(viewRouter.selectedView)
                                    } else if $0.startLocation.x == $0.location.x {
                                        self.swipeHorizontalDirection = .none
                                    } else {
                                        self.swipeHorizontalDirection = .right
                                        print(viewRouter.selectedView)
                                    }
                                }
                        )
                case .GameIntroduction1:
                    GameIntroduction1()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: AnyTransition.move(edge: .leading)))
                        .animation(Animation.linear)
                        .gesture(
                            DragGesture(minimumDistance: 100)
                                .onChanged {
                                    if $0.startLocation.x > $0.location.x {
                                        self.swipeHorizontalDirection = .left
                                        print(viewRouter.selectedView)
                                    } else if $0.startLocation.x == $0.location.x {
                                        self.swipeHorizontalDirection = .none
                                    } else {
                                        self.swipeHorizontalDirection = .right
                                        viewRouter.selectedView = .MainMenu
                                        print(viewRouter.selectedView)
                                    }
                                }
                        )
                case .GameIntroduction2:
                    GameIntroduction2()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: AnyTransition.move(edge: .leading)))
                        .animation(Animation.linear)
                        .gesture(
                            DragGesture(minimumDistance: 100)
                                .onChanged {
                                    if $0.startLocation.x > $0.location.x {
                                        self.swipeHorizontalDirection = .left
                                        print(viewRouter.selectedView)
                                    } else if $0.startLocation.x == $0.location.x {
                                        self.swipeHorizontalDirection = .none
                                    } else {
                                        self.swipeHorizontalDirection = .right
                                        viewRouter.selectedView = .GameIntroduction1
                                        print(viewRouter.selectedView)
                                    }
                                }
                        )
                case .GameIntroduction3:
                    GameIntroduction3()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: AnyTransition.move(edge: .leading)))
                        .animation(Animation.linear)
                        .gesture(
                            DragGesture(minimumDistance: 100)
                                .onChanged {
                                    if $0.startLocation.x > $0.location.x {
                                        self.swipeHorizontalDirection = .left
                                        print(viewRouter.selectedView)
                                    } else if $0.startLocation.x == $0.location.x {
                                        self.swipeHorizontalDirection = .none
                                    } else {
                                        self.swipeHorizontalDirection = .right
                                        viewRouter.selectedView = .MainMenu
                                        print(viewRouter.selectedView)
                                    }
                                }
                        )
                case .GameView:
                    GameViewWrapper()
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing), removal: AnyTransition.move(edge: .leading)))
                        .animation(Animation.linear)
                        .onAppear(perform: {
                            audioPlayer.stop()
                        })
                }
        }
//        .transition(AnyTransition.move(edge: .trailing))
//        .animation(Animation.spring(response: 1, dampingFraction: 0.5, blendDuration: 0))
        } .onAppear(perform: {
            playSounds("RainSound.wav")
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())

    }
}
