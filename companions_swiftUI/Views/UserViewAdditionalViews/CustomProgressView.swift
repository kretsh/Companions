//
//  CustomProgressView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI

struct CustomProgressView: View{
    let level: Int
    @State private var progress: Double
    
    init(progress: Double?) {
        guard let level = progress else{
            self.level = 0
            self.progress = 0.0
            return
        }
        self.progress = level.truncatingRemainder(dividingBy: 1)
        self.level = Int(level)
    }
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 0.75)
                .padding(10)
                .frame(height: 75)
                .foregroundColor(Color("CustomGrey"))
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 0.75)
                    .padding(10)
                    .frame(width: 20 + progress * 400, height: 75)
                    .foregroundColor(Color("CustomBlue"))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ZStack{
                Text("level \(level) - \(String(format: "%g", progress * 100))%")
                    .foregroundColor(.white)
            }
        }
    }
}
