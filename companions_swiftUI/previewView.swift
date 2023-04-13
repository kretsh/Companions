//
//  previewView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 13.04.2023.
//

import SwiftUI

struct previewView: View {
    @ObservedObject var model = usersModel()
    
    
    var body: some View {
        let isLoading: Bool = model.isLoading
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                VStack{
                    AsyncImage(url: model.users[4].images.versions.small)
                }
                
            }
        }
    }
}
                    

struct previewView_Previews: PreviewProvider {
    static var previews: some View {
        previewView()
    }
}
