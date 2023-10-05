//
//  SignInViewModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 09/08/2023.
//

import Foundation

final class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
