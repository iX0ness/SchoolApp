//
//  ProfileModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 21/12/2023.
//

import SwiftUI

final class ProfileModel: ObservableObject {
    private let userService: UserServiceProtocol
    private let subjectsService: SubjectsServiceProtocol
    
    @Published var user: User?
    @Published var subject: Subject?
    
    init(userService: UserServiceProtocol, subjectsService: SubjectsServiceProtocol) {
        self.userService = userService
        self.subjectsService = subjectsService
    }
    
    @MainActor
    func loadUser(id: String) async {
        user = await userService.loadUser(by: id)
    }
    
    @MainActor
    func loadSubject(for userId: String) async {
        subject = await subjectsService.loadSubject(for: userId)
    }
    
    @MainActor
    func updateImage(data: Data?) async {
        guard let data = data,
              let userId = user?.id,
              let imageURL = await userService.updateProfileImage(fileName: userId, data: data) else { return }
        
        await userService.updateUser(by: userId, with: imageURL)
        
        user?.profileImageURL = imageURL
    }
}
