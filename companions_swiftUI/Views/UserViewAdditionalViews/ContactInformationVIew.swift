//
//  ContactInformationVIew.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 25.04.2023.
//

import SwiftUI

struct ContactInformationView: View{
    var user: UserFull
    
    
    var body: some View{
        ZStack{
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .foregroundColor(Color("CustomGrey"))
            
            VStack(alignment: .leading){
                Text("Email: " + user.email)
                    .padding(10)
                    .foregroundColor(Color("CustomBlue"))
                Text("Phone:" + user.phone!)
                    .padding(10)
            }
            .foregroundColor(.white)
            .padding(10)
        }
    }
}
