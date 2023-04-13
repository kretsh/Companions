//
//  SearchField.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import SwiftUI

struct SearchView: View{
    @State private var searchText: String = ""
    var body: some View{
        let thing = TextField("Search", text: $searchText)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
            .background(Color(.systemGray6))
            .offset(y: searchText.isEmpty ? 0 : -200)
        VStack{
            if searchText.count == 0{
                
                Text("Search User")
                    .foregroundColor(Color(hue: 0.592, saturation: 0.359, brightness: 0.952))
                    .bold()
                    .font(.system(size: 26, weight: .black, design: .default))
                    .kerning(8)
            }
            thing
        }
        
    }


}

