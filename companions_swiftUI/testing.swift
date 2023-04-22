//
//  testing.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 20.04.2023.
//

import SwiftUI


struct ContentView: View {
    let examAttempts = ["Attempt 1: 70%"]
    
    var body: some View {
        VStack {
            ExamView(attempts: examAttempts)
        }
    }
}

struct ExamView: View {
    let attempts: [String]
    @State private var showAllAttempts = false
    
    var body: some View {
        VStack {
            Text("Attempts:")
                .font(.headline)
            if !showAllAttempts {
                Text(attempts.last ?? "")
            } else {
                VStack {
                    ForEach(attempts, id: \.self) { attempt in
                        Text(attempt)
                            .opacity(100)
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut(duration: 0.5), value: showAllAttempts)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                    }
                }
                .transition(.identity)
                .animation(.easeInOut(duration: 0.5), value: showAllAttempts)
            }
        }
        .onTapGesture {
            withAnimation {
                showAllAttempts.toggle()
            }
        }
    }
}


struct ExamViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
