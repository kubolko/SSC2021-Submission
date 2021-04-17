//
//  GameIntroduction1.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 08/04/2021.
//

import SwiftUI

struct GameIntroduction1: View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            Color("BlackCoral")
                .ignoresSafeArea()
            // rain
            BackgroundSender()
            HStack {
                VStack(spacing: 50) {
                    QuoteView(text: "“Probable mental health conditions increased from 10.8% in 2017 to 16% in July 2020 across all age, sex, and ethnic groups. “", author: "England’s Mental Health of Children and Young People Survey (MHCYP).")
                        .padding()
                    QuoteView(text: "“46% report having less motivation to do activities they usually enjoyed. 36% feel less motivated to do regular chores.”", author: "UNICEF.org")
                        .padding()

                }.padding()
                VStack(spacing: 50) {
                    QuoteView(text: "“Among the participants, 27% reported feeling anxiety and 15% depression in the last seven days.”", author: "UNICEF.org")
                        .padding()
                    Button {viewRouter.selectedView = .GameIntroduction2
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
                    .padding()
                }
            }
        }
    }
}
    struct GameIntroduction1_Previews: PreviewProvider {
        static var previews: some View {
            GameIntroduction1().environmentObject(ViewRouter())
        }
    }
