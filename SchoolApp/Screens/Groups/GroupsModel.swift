//
//  GroupsModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 09/08/2023.
//

import Foundation

final class GroupsModel: ObservableObject {
    @Published var groups: [Group] = []
    
    private let groupsService: GroupsServiceProtocol
    
    init(groupsService: GroupsServiceProtocol) {
        self.groupsService = groupsService
    }
    
    @MainActor
    func loadGroups(for userId: String) async {
        groups = await groupsService.loadGroups(for: userId)
    }
}
