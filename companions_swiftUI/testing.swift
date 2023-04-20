//
//  testing.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 20.04.2023.
//

import SwiftUI


struct testing: View {
    let items = (1...10).map { "item\($0)" }
    
    var body: some View {
        Text("hello")
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(items, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing()
    }
}
