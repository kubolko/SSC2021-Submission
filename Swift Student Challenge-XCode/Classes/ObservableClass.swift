//
//  File.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 05/04/2021.
//

import Foundation
import SpriteKit


class MainClass: ObservableObject {
    
    static let shared = MainClass()
    @Published var nameAndHobby: [String] = ["John","Swift"]
    
    func gainData(string1: String, string2: String){

            nameAndHobby = []
            nameAndHobby.append(string1)
            nameAndHobby.append(string2)
            print(nameAndHobby)
            
    }
    

}
