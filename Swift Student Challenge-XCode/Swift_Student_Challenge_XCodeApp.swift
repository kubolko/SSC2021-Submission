//
//  Swift_Student_Challenge_XCodeApp.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 03/04/2021.
//

import SwiftUI

@main
struct Swift_Student_Challenge_XCodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewRouter())
        }
    }
}
