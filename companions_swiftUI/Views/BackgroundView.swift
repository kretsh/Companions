//
//  BackgroundStruct.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 11.04.2023.
//

import SwiftUI

struct BackgroundView: View{

    
    var body: some View{
            Image("Fluvius")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        VStack{
            Image("42_logo").resizable().frame(width: 150, height: 150).padding(-20)
            Spacer()
        }
    }
}
