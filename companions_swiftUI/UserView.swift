//
//  UserView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DetailView()) {
                    Text("Tap me to go to the detail view!")
                }
            }
            .navigationTitle("My List")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Welcome to the detail view!")
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
