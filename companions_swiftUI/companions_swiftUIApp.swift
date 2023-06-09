//
//  companions_swiftUIApp.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import SwiftUI

@main
struct companions_swiftUIApp: App {
    var viewModel = ViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            CompanionView(viewModel: viewModel)
        }
    }
}
