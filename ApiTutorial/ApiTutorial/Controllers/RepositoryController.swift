//
//  RepositoryController.swift
//  ApiTutorial
//
//  Created by kuehar on 2023/05/22.
//

import Foundation

struct RepositoryController{
    let model: GithubModel
    let urlString: String
    
    public func loadStart(){
        model.fetchRepositories(urlString: urlString)
    }
}
