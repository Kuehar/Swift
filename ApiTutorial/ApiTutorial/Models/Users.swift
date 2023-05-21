//
//  User.swift
//  ApiTutorial
//
//  Created by kuehar on 2023/05/22.
//

import Foundation

struct Users:Codable{
    let totalCount:Int
    let incompleteResults:Bool
    let items:[User]
    
    private enum CodingKeys:String,CodingKey{
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct User:Codable,Identifiable{
    let id = UUID()
    let login:String
    let avatarUrl:String
    let reposUrl:String
    static let mockUser = User(login: "Kuehar", avatarUrl: "",reposUrl: "https://api.github.com/users/Kuehar/repos")
    
    private enum CodingKeys: String, CodingKey {
            case login
            case avatarUrl = "avatar_url"
            case reposUrl = "repos_url"
        }
}
