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
    var id: Int64
    var name: String
}

struct SearchResponse<I>: Response {
    typealias Item = I

    var items: [I]
    var totalCount: Int
}
