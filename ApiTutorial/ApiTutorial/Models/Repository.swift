//
//  Repository.swift
//  ApiTutorial
//
//  Created by kuehar on 2023/05/22.
//

import Foundation

/// GithubのAPIが返すリポジトリのデータ。必要なプロパティのみを取得する
struct Repository: Codable, Identifiable {
    let id = UUID()
    let name: String
    let htmlUrl: String
    let description: String?
    let language: String?
    let stargazersCount: Int
    let forksCount: Int

    private enum CodingKeys: String, CodingKey {
        case name
        case htmlUrl = "html_url"
        case description
        case language
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }

    static let mock = Repository(name: "Swift",
                                 htmlUrl: "https://github.com/Kuehar/Swift",
                                 description: "",
                                 language: "Swift",
                                 stargazersCount: 1000,
                                 forksCount: 100)
}
