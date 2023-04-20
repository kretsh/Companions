//
//  UserView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

//struct UserView: View {
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: DetailView()) {
//                    Text("Tap me to go to the detail view!")
//                }
//            }
//            .navigationTitle("My List")
//        }
//    }
//}

struct DetailView: View {
    let user: UserFull
    
    var body: some View {
        ScrollView{
            ZStack{
                BackgroundView()
//                Image("Fluvius") // Заглушка, нужны обои его коалиции
//                    .resizable()
//                    .frame(maxHeight: .infinity)
                AsyncImage(url: user.image.versions.large)
//                AsyncImage(url: user.image.versions.large)
                Text("Template")
                Text(user.name)
                Text(user.location ?? "Otdihaet")
            }
            }
            
            
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
