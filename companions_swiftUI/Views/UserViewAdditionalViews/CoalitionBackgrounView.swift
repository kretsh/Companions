//
//  CoalitionBackgrounView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI

struct CoalitionBackroundView: View{
    var body: some View{
        Image("Fluvius")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

