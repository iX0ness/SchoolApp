//
//  GroupScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import SwiftUI

struct GroupsScreen: View {
    @StateObject var groupsModel: GroupsModel = GroupsModel(
        userService: Dependencies.usersService,
        groupService: Dependencies.groupService
    )
    
    private let userId: String
    private let columns = [
        GridItem(.fixed(150), spacing: 30),
        GridItem(.fixed(150), spacing: 30)
    ]
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(groupsModel.groups) { group in
                        GroupCellView(group: group)
                            .frame(width: 150, height: 30)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Groups")
            .task {
                await groupsModel.loadGroups(for: userId)
            }
        }
    }
}

struct GroupsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GroupsScreen(userId: "mGQtQonDiRRlJtzHk5AdGiX3w6p1")
            .environmentObject(AuthManager.shared)
    }
}

extension GroupsScreen {
    struct Dependencies {
        static let usersService: UserServiceProtocol = UserService()
        static let groupService: GroupServiceProtocol = GroupService()
    }
}
