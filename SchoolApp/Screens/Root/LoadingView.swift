//
//  LoadingView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/10/2023.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    private let delay: TimeInterval = 2.0
    
    var body: some View {
        VStack {
            LottieView(lottieFile: "loader_main")
                .frame(width: 80, height: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.white))
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                isLoading.toggle()
            }
        }
    }
}

#Preview {
    LoadingView(isLoading: .constant(true))
}
