//
//  PersonalInformationView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI

struct PersonInformationView: View{
    let user:       UserFull
    let campus:     String
    
    let map: [String:String]
    
    init(user: UserFull){
        self.user = user
        self.campus = self.user.campus
        map = ["wallet":self.user.wallet, "evalPoints":self.user.points, "cursus":self.user.cursus!.cursus.name, "member":self.user.member]
    }
    
    
    
    var body: some View{
        VStack{
            Text("42"+campus)
                .foregroundColor(Color("CustomBlue"))
                .font(.system(size: 34, weight: .bold , design: .serif))
                .padding(10)
            Text(user.name)
                .font(.system(size: 28, weight: .bold , design: .serif))
                .foregroundColor(.white)
            Text(user.nickname)
                .font(.system(size: 26, weight: .bold , design: .serif))
                .foregroundColor(.white)
        }.padding(50)
        HStack {
            ForEach(map.sorted(by: <), id: \.key) { key, value in
                Spacer()
                    .frame(width: 10)
                VStack {
                    Text(key)
                        .foregroundColor(Color("CustomBlue"))
                    Spacer()
                        .frame(height: 10)
                    Text(value)
                }
                .font(.system(size: 12, weight: .bold , design: .serif))
                .foregroundColor(.white)
            }
        }
    }
}
