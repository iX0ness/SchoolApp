//
//  GroupsModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 09/08/2023.
//

import Foundation

final class GroupsModel: ObservableObject {
    @Published var groups: [Group] = []
    
    private let userService: UserServiceProtocol
    private let groupService: GroupServiceProtocol
    
    init(userService: UserServiceProtocol, groupService: GroupServiceProtocol) {
        self.userService = userService
        self.groupService = groupService
    }
    
    @MainActor
    func loadGroups(for userId: String) async {
        var user: User?
        
        do {
            user = try await userService.loadUser(by: userId)
        } catch {
            DebugTool.print(message: "Failed to fetch user from database", error: error)
        }
        
        guard let user = user else { return }
        
        groups = await groupService.loadGroups(user.groups)
    }
}

