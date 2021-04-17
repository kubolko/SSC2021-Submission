//
//  QuoteView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 08/04/2021.
//

import SwiftUI

struct QuoteView: View {

    let text: String
    let author: String

    var body: some View {
        VStack(alignment: .trailing) {
            Text(text)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            HStack {
                Spacer()
            Text(author)
                .font(.system(size: 9))
                .fontWeight(.regular)
                .multilineTextAlignment(.trailing)
            }
        }.frame(width: 220)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(text: "“Probable mental health conditions increased from 10.8% in 2017 to 16% in July 2020 across all age, sex, and ethnic groups. “", author: "England’s Mental Health of Children and Young People Survey (MHCYP).")
    }
}
