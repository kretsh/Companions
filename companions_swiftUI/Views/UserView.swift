//
//  TemplateView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 19.04.2023.
//

import SwiftUI

struct UserView: View {
    let user: UserFull
    

    var body: some View {
        ScrollView{
            ImageUserView(user: user)
            Spacer()
                .frame(height: 0)
            ZStack{
                CoalitionBackroundView()
                VStack(spacing: 0){
                    PersonInformationView(user: user)
                    AvailableView(location: user.location)
                    CustomProgressView(progress: user.level)
                }
            }
            Spacer().frame(height: 0)
            VStack{
                ContactInformationView(user: user)
                ProjectInformationView(user: user).frame(minHeight: 0, maxHeight: 400)
                ExpertiseInformationView(user: user)
            }
        }
    }
}














