//
//  GroupService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import Foundation

final class GroupsServiceStub: GroupsServiceProtocol {
    func loadGroups(for userId: String) async -> [Group] {
        return [.mock, .mock, .mock, .mock, .mock]
    }
}
