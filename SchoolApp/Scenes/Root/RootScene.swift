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
    @StateObject var rootModel: RootModel
    
    var body: some View {
        view
    }
    
    @ViewBuilder
    var view: some View {
        switch rootModel.authState {
        case .loading:
            LottieView(lottieFile: "loader_main")
                .frame(width: 80, height: 80)
        case .authorized(let user):
            HomeScene(userId: user.uid)
        case .unAuthorized:
            SignInScene()
        }
    }
}

struct LoaderScene_Previews: PreviewProvider {
    static var previews: some View {
        RootScene(rootModel: RootModel(loaderService: LoaderServiceStub()))
    }
}
