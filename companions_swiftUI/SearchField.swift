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
        
        return thing
    }


}

