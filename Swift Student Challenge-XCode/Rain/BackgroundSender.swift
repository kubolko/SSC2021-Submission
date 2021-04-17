//
//  BackgroundSender.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 17/04/2021.
//

import SwiftUI

struct BackgroundSender: View {
    var body: some View {
        // rain
        EmitterView(images: ["line"], particleCount: 100, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [Color(red: 0.8, green: 0.8, blue: 1)], alphaRange: 1, angle: Angle(degrees: 180), scale: 0.6, speed: 1000, speedRange: 400, animation: Animation.linear(duration: 1).repeatForever(autoreverses: false), animationDelayThreshold: 1)
    }
}

struct BackgroundSender_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSender()
    }
}
