//
//  ProfileModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 21/12/2023.
//

import SwiftUI

final class ProfileModel: ObservableObject {
    private let userService: UserServiceProtocol
    
    @Published var user: User?
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    @MainActor
    func loadUser(id: String) async {
        user = await userService.loadUser(by: id)
    }
    
    @MainActor
    func updateImage(data: Data?) async {
        guard let data = data, let id = user?.id else { return }
              
        let imageURL = await userService.updateProfileImage(fileName: id, data: data)
        
        guard let imageURL else { return }
        
        await userService.updateUser(by: id, with: imageURL)
        
        user?.profileImageURL = imageURL
    }
}
