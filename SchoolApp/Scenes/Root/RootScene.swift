//
//  LoaderScene.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI
import Combine
import FirebaseAuth

struct RootScene: View {
    @StateObject var authManager: AuthManager
    @State private var isLoading = false
    
    var body: some View {
        if let user = authManager.currentUser {
            HomeScene(userId: user.uid)
                .onAppear { isLoading = true }
                .overlay {
                    LoadingView(isLoading: $isLoading)
                        .opacity(isLoading ? 1 : 0)
                }
        } else {
            SignInScene()
                .onAppear { isLoading = true }
                .overlay {
                    LoadingView(isLoading: $isLoading)
                        .opacity(isLoading ? 1 : 0)
                }
        }
    }
}

//struct LoaderScene_Previews: PreviewProvider {
//    static var previews: some View {
//        RootScene(rootModel: RootModel(loaderService: LoaderServiceStub()))
//    }
//}
