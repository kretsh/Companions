//
//  CompanionView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

struct CompanionView: View {
        var backgroundUI = BackgroundView()
        @ObservedObject var viewModel = usersModel()

    var body: some View {
        ZStack{
            backgroundUI
            if !viewModel.errorLoading{
                ZStack {
                    if viewModel.isLoading {
                        RotatingProgressView()
                        
                    } else {
                        SearchBarView(viewModel.users)
                    }
                }
            }else{
                VStack{
                    Image("small_shazam")
                    Text("You are not allowed to pass")
                }
            }
        }
    }
}









struct CompanionView_Previews: PreviewProvider {
    static var previews: some View {
        CompanionView()
    }
}
