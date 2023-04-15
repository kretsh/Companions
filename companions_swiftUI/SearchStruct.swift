//
//  SearchField.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import SwiftUI

struct SearchView: View{
    @State private var searchText: String = ""
    let users: [UserResponse]
    
    init(_ userToShow: [UserResponse]){
        self.users = userToShow
    }
    
    var filteredData: [UserResponse] {
            if searchText.isEmpty {
                return users
            } else {
                return users.filter { $0.nickname.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    var body: some View{
        let thing = TextField("Search", text: $searchText)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
            .background(Color(.systemGray6))
            .padding(20)
        VStack{
            thing.offset(y: searchText.isEmpty ? 0 : -10)
            if searchText.isEmpty{
                Text("Search User")
                    .foregroundColor(Color(hue: 0.592, saturation: 0.359, brightness: 0.952))
                    .bold()
                    .font(.system(size: 26, weight: .black, design: .default))
                    .kerning(8)
                    .padding(10)
            }
            else{
                    List(filteredData, id: \.self.nickname) { item in
                        previewView(item)
                            .onTapGesture {
                            print("Hello world")
                        }
                    }
                .listStyle(.grouped)
                .listRowInsets(EdgeInsets())
                .ignoresSafeArea()
            }
        }
    }
}

