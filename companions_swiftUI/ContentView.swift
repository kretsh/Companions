//
//  ContentView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import Alamofire
import SwiftUI


struct ContentView: View {
    @ObservedObject var model = usersModel()
    
    var backgroundUI = BackgroundView()

    var body: some View {
        ZStack{
            let isLoading: Bool = model.isLoading
            ZStack {
                if isLoading {
                    ProgressView()
                } else {
                    var searchUI = SearchView(model.users)
                    backgroundUI
                    searchUI
                }
            }
        }
    }
}




















    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

