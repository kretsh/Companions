//
//  SearchView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import SwiftUI

struct QuickUserView: View {
    let user: User
    
    
    init(_ userToShow: User){
        self.user = userToShow
    }
    var body: some View {
        ZStack{
            HStack{
                AsyncImage(url: user.images.versions.small){ image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(maxWidth: sizes.maxWidth, maxHeight: sizes.maxHeight, alignment: .leading)
                        .aspectRatio(contentMode: .fit)
                        
                    
                } placeholder: {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .frame(maxWidth: sizes.maxWidth, maxHeight: sizes.maxHeight, alignment: .leading)
                }
                Text(user.nickname).foregroundColor(.blue).frame(alignment: .leading)
                Spacer()
                Text("Level 9")
            }
        }
    }
    
    private struct sizes{
        static let maxHeight: CGFloat = 60
        static let maxWidth: CGFloat = 40
    }
}
