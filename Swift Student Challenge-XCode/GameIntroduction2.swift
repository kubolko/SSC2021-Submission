//
//  GameIntroduction2.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 09/04/2021.
//

import SwiftUI

struct GameIntroduction2: View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            Color("BlackCoral")
                .ignoresSafeArea()
            // rain
            BackgroundSender()
            VStack {
                VStack {
                    Text("“We find that positive affect is greatest when outdoors and that engaging in hobbies and physically active pursuits such as exercising, walking, and gardening are particularly positive activities.”")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(width: 440)
                    HStack {
                        Spacer()
                        Text("Hanson & Jones, 2015; MacKerron & Mourato, 2013; Reed & Ones, 2006")
                            .font(.system(size: 9))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 160)
                    }
                }.frame(width: 440)
                HStack {
                    Spacer()
                    Button {viewRouter.selectedView = .GameIntroduction3
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

struct GameIntroduction2_Previews: PreviewProvider {
    static var previews: some View {
        GameIntroduction2().environmentObject(ViewRouter())
    }
}
