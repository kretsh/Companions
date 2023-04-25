//
//  ExpertiseInformationView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 25.04.2023.
//

import SwiftUI

struct ExpertiseInformationView: View{
    let user: UserFull
    
    var body: some View{
        if let skills = self.user.cursus?.skills{
            Text("Skills:").frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .bold)).padding(10)
            ForEach(skills, id: \.self.id){ item in
                VStack{
                    Text(item.name)
                    CustomProgressView(progress: item.level)
                }
            }
        }
    }
}
