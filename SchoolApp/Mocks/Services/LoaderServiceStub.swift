//
//  LoaderServiceStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/10/2023.
//

import Foundation
import Combine
import FirebaseAuth

final class LoaderServiceStub: LoaderServiceProtocol {
    var userPublisher: PassthroughSubject<FirebaseAuth.User?, Never> = .init()
}
