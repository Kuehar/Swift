//
//  UserSearchView.swift
//  ApiTutorial
//
//  Created by kuehar on 2023/05/21.
//

import SwiftUI

struct UserSearchView: View {
    @State private var searchText:String = ""
    @ObservedObject var model = GithubModel()
    
    var body: some View {
           NavigationView {
               VStack {
                   TextField("user name", text: $searchText)
                       .onChange(of: searchText) { _ in
                           UserController(model: model, query: searchText).loadStart()
                       }
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .keyboardType(.asciiCapable)
                       .padding()
                   Spacer()
                   if let error = model.error {
                       Text(error.localizedDescription)
                   } else {
                       if model.isNotFound {
                           Text("user not found")
                       } else {
                           List(model.users) { user in
                               NavigationLink(destination: RepositoryView(repositoryUrlString: user.reposUrl)) {
                                   UserRow(user: user)
                               }
                           }
                           .refreshable {
                               UserController(model: model, query: searchText).loadStart()
                           }
                       }
                   }
                   Spacer()
               }
               .navigationTitle("🔍GitHubユーザーを検索")
           }
       }
   }

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
