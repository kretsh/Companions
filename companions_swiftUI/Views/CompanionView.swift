//
//  CompanionView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

struct CompanionView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searchText: String = ""
    @State var user: UserFull?
    
    private func fetchData(id: Int){
        viewModel.userFetch(idOfUser: id) { user in
            self.user = user
        }
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(logoSign: true)
                VStack {
                    switch (viewModel.errorLoading, viewModel.isLoading) {
                        case (true, _):
                            ErrorView()
                        case (_, true):
                            RotatingProgressView()
                        case (_, _):
                            searchBar
                    }
                }
            }
        }
    }

    
    var searchBar: some View{
        VStack {
            TextField("Search", text: $searchText)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
                .background(Color(.systemGray6))
                .padding(20)
                .onChange(of: searchText) { newValue in
                    viewModel.usersFetch(login: newValue)
                }
            if viewModel.users.isEmpty {
                if searchText.isEmpty {
                    Text("Search User")
                        .foregroundColor(Color(hue: 0.592, saturation: 0.359, brightness: 0.952))
                        .bold()
                        .font(.system(size: 26, weight: .black, design: .default))
                        .kerning(8)
                        .padding(10)
                } else {
                    if viewModel.isLoading {
                        RotatingProgressView()
                    } else {
                        Text("No results found")
                            .foregroundColor(.red)
                            .bold()
                            .padding(10)
                    }
                }
            } else {
                List(viewModel.users) { user in
                    Button(action: {
                        fetchData(id: user.id)
                    }){QuickUserView(user)}
                }
                .listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets())
                .ignoresSafeArea()
                
            }
        }.sheet(item: $viewModel.selectedUser) { user in
            UserView(user: user)}
    }
}
                    


