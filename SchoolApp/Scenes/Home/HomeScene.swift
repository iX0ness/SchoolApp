//
//  HomeScene.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import SwiftUI

struct HomeScene: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel(userService: Dependencies.usersService)
//    @EnvironmentObject var authManager: AuthManager
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
                    ForEach(viewModel.groups) { group in
                        GroupCellView(group: group)
                            .frame(width: 150, height: 30)
                    }
                    .padding()
                }
                .padding()
                
//                Button("Logout") {
//                    do {
//                        try authManager.singOut()
//                    } catch {
//                        
//                    }
//                }
            }
            .navigationTitle("Groups")
            .task {
                await viewModel.loadUser(id: userId)
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScene(viewModel: HomeViewModel(
//            userService: HomeScene.Dependencies.usersService), userId: "mGQtQonDiRRlJtzHk5AdGiX3w6p1"
//        )
//        .environmentObject(AuthManager.shared)
//    }
//}

extension HomeScene {
    struct Dependencies {
        static let usersService: UserService = UserServiceImpl()
    }
}

