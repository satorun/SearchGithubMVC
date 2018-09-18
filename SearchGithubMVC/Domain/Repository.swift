//
//  Repository.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/19.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation

struct Repository {
    let id: Int64
    let name: String
}

struct SearchResponse<Item> {
    let items: [Item]
    let totalCount: Int
}
