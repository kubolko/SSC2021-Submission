//
//  GameIntroduction3.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 09/04/2021.
//

import SwiftUI

struct GameIntroduction3: View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            Color("BlackCoral")
                .ignoresSafeArea()
            // rain
            BackgroundSender()
            VStack {
                VStack {
                Text("What are you waiting for? Go and let them know, that they aren’t alone in their passions!")
                    .font(.system(size: 24))
                }.frame(width: 440)
                HStack {
                    Spacer()
                    Button {viewRouter.selectedView = .GameView
                        print(viewRouter.selectedView)
                    }
                    label: {
                        HStack {
                            Text("Tap to continue")
                                .underline()
                            Image(systemName: "play.fill")
                        }
                        .padding()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                        .frame(width: 200)
                }
            }
        }
    }
}

struct GameIntroduction3_Previews: PreviewProvider {
    static var previews: some View {
        GameIntroduction3().environmentObject(ViewRouter())
    }
}
