//
//  ViewRouter.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 08/04/2021.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var selectedView: Page = .MainMenu
}
enum Page {
    case MainMenu
    case HowToPlayView
    case GameIntroduction1
    case GameIntroduction2
    case GameIntroduction3
    case GameView
}
