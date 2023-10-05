//
//  HomeViewModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 09/08/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var user: User? {
        didSet {
            Task { await loadGroups() }
        }
    }
    @Published var groups: [Group] = []
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    @MainActor
    func loadUser(id: String) async {
        do {
            user = try await userService.loadUser(by: id)
        } catch {
            DebugTool.print(message: "Failed to fetch user from database", error: error)
        }
    }
    
    @MainActor
    func loadGroups() async {
        guard let user = user else { return }
        
        groups = await userService.loadGroups(user.groups)
    }
}

