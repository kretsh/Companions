//
//  ImageUserView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI

struct ImageUserView: View {
    let user: UserFull
    var body: some View {
        AsyncImage(url: user.image){ item in
            item
                .resizable()
                .frame(maxHeight: 600)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
        }placeholder: {
            Image("placeholder")
                .resizable()
                .frame(maxHeight: 200)
                .ignoresSafeArea()
        }
            
    }
}
