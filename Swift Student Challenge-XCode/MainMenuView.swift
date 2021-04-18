//
//  MainMenuView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 08/04/2021.
//

import SwiftUI

struct MainMenuView: View {

    let gradient = Gradient(colors: [Color("BlackCoral"), Color("USAFABlue")])
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            VStack {
                Text("Never Bore")
                    .font(.system(size: 72))
                    .fontWeight(.bold)
                Button {
                    viewRouter.selectedView = .GameIntroduction1
                    print(viewRouter.selectedView)
                }label: {
                ZStack {
                    Rectangle()
                        .fill(Color("DarkCornflower"))
                        .frame(width: 135, height: 40, alignment: .center)
                        .cornerRadius(20)
                    Text("Play")
                        .fontWeight(.semibold)
                        .font(.system(size: 36))
                }
                }.buttonStyle(PlainButtonStyle())
                Button {
                    viewRouter.selectedView = .HowToPlayView
                    print(viewRouter.selectedView)
                }label: {
                ZStack {
                    Rectangle()
                        .fill(Color("DarkCornflower"))
                        .frame(width: 100, height: 40, alignment: .center)
                        .cornerRadius(20)

                        Text("Learn how to play")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 40, alignment: .center)
                    }
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView().environmentObject(ViewRouter())
    }
}
