//
//  GroupService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import Foundation

final class GroupServiceStub: GroupServiceProtocol {
    func loadGroups(_ groupIds: [String]) async -> [Group] {
        return [.mock, .mock, .mock, .mock, .mock]
    }
}
