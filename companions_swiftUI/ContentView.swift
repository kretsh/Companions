//
//  ContentView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import Alamofire
import SwiftUI



struct ContentView: View {
    var searchUI = SearchView()
    var backgroundUI = BackgroundView()
    var model = usersModel()
    
    
    var body: some View {
        ZStack{
            backgroundUI
            searchUI.padding(20)
//            List{
//                for i in 1...3{
//
//                }
//                Text("2")
//                Text("4")
//                Text("6")
//            }
////            for i in 1...5{
////                Text(<#T##S#>)
//            }
            }
            
    }
}
    
















    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

