//
//  AvailableView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI

func getLocation(_ value: String?) -> (String, String){
    switch value{
    case .none:
        return ("Unavailable", "-")
    case .some(let someStr):
        return ("Available", someStr)
    }

}

struct AvailableView: View{
    let firstRow, secondRow: String
    
    init(location: String?){
        let result = getLocation(location)
        firstRow = result.0
        secondRow = result.1
    }
    var body: some View{
        ZStack(){
            Rectangle()
                .padding(10)
                .aspectRatio(3.0/1.3, contentMode: .fit)
                .foregroundColor(Color("CustomGrey"))
            VStack{
                Text(firstRow)
                Text(secondRow)
            }
        }.foregroundColor(.white)
    }
}
