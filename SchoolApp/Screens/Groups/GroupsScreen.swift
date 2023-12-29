//
//  GroupScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import SwiftUI

struct GroupsScreen: View {
    @EnvironmentObject var userModel: UserModel
    @StateObject private var groupsModel = GroupsModel(groupsService: Dependencies.groupsService)
    
    private let columns = [
        GridItem(.fixed(150), spacing: 30),
        GridItem(.fixed(150), spacing: 30)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(groupsModel.groups) { group in
                        NavigationLink {
                            StudentsScreen(group: group)
                        } label: {
                            TitleCell(title: group.name)
                                .frame(width: 150, height: 60)
                                .primaryCellStyle()
                        }
                        
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Groups")
            .task {
                if let user = userModel.user {
                    await groupsModel.loadGroups(for: user.id)
                }
            }
        }
    }
}

struct GroupsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GroupsScreen()
            .environmentObject(AuthManager.shared)
    }
}

extension GroupsScreen {
    struct Dependencies {
        static var groupsService: GroupsServiceProtocol = GroupsService()
    }
}
