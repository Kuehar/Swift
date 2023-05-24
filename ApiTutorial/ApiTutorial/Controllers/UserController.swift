//
//  UserController.swift
//  ApiTutorial
//
//  Created by kuehar on 2023/05/21.
//

import Foundation

// UserSearchViewで検索項目欄に入力が与えられた時に動くController
struct UserController{
    let model:GithubModel
    let query:String
    
    // Modelに読み込み開始を要求する
    public func loadStart(){
        model.fetchUser(query:query)
    }
}
