//
//  LoaderService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/10/2023.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoaderServiceProtocol {
    var userPublisher: PassthroughSubject<FirebaseAuth.User?, Never> { get }
}

final class LoaderService: LoaderServiceProtocol {
    var userPublisher: PassthroughSubject<FirebaseAuth.User?, Never> = .init()
    
    init() {
       bind()
    }

    private func bind() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.userPublisher.send(user)
        }
    }
}
