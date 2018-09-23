//
//  Repository.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/19.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Result


struct Repository {
    struct Owner {
        var login: String
    }
    
    var id: Int64
    var name: String
    var fullName: String
    var owner: Owner
    var htmlUrl: URL
    var language: String?
}

struct SearchResponse<I>: Response {
    typealias Item = I

    var items: [I]
    var totalCount: Int
}
