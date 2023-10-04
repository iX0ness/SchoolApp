//
//  RootModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Combine

enum AuthState: Hashable {
    case loading
    case authorized(FirebaseAuth.User)
    case unAuthorized
}

final class RootModel: ObservableObject {
    @Published var authState: AuthState = .loading
    private let loaderService: LoaderServiceProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    init(loaderService: LoaderServiceProtocol) {
        self.loaderService = loaderService
        bind()
    }
    
    private func bind() {
        loaderService.userPublisher
            .sink { [weak self] user in
                self?.authState = .loading
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if let user = user {
                        self?.authState = .authorized(user)
                    } else {
                        self?.authState = .unAuthorized
                    }
                }
            }
            .store(in: &subscriptions)
    }
}
