//
//  IntrestGuide.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 05/04/2021.
//

import SwiftUI

struct IntrestGuide: View {
    var body: some View {
        VStack(){
            HStack(){
                Text("IT")
                    .fontWeight(.semibold)
                Circle()
                    .fill(Color("IT"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Swift - Overclocking- Web Development")
                    .foregroundColor(Color("IT"))
            }
            HStack(){
            Text("Sports")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Sports"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Marathons - Swimming - Golf")
                    .foregroundColor(Color("Sports"))
                
            }
            HStack(){
            Text("Music")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Music"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("808 - Gituar - Violin")
                    .foregroundColor(Color("Music"))
                
            }
            HStack(){
            Text("Outdoors")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Outdoors"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Bushcraft - Travelling - Fishing")
                    .foregroundColor(Color("Outdoors"))
                
            }
            HStack(){
            Text("Extreme")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Extreme"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Skydiving - Downhill biking - Motocross")
                    .foregroundColor(Color("Extreme"))
                
            }
            HStack(){
            Text("Calm")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Calm"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Crocheting - Collecting stamps - Chess")
                    .foregroundColor(Color("Calm"))
                
            }
            HStack(){
            Text("Art")
                .fontWeight(.semibold)
                Circle()
                    .fill(Color("Art"))
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Painting - Photography - Custom clothes")
                    .foregroundColor(Color("Art"))
                
            }
        }
            }
}

struct IntrestGuide_Previews: PreviewProvider {
    static var previews: some View {
        IntrestGuide()
    }
}
