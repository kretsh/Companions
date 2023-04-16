//
//  RotatingProgressView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

struct RotatingProgressView: View {
    @State private var isAnimating = false
    
    var body: some View {
            VStack{
                Image("small_shazam")
                    .clipShape(Circle())
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .frame(width: 20, height: 20)
                    .padding(100)
                Text("Loading...").font(.title2)
            }
        .onAppear() {
            self.isAnimating = true
        }
        .onDisappear() {
            self.isAnimating = false
        }
    }
}
