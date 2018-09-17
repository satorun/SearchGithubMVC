//
//  GitHubAPI.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/17.
//  Copyright © 2018年 satorun. All rights reserved.
//

import APIKit
import Himotoki

final class GitHubAPI {
    struct SearchRepositoriesRequest: GitHubRequest {
        let query: String
        
        typealias Response = SearchResponse<Repository>
        
        var method:HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: Any? {
            return ["q": query]
        }
    }
}

struct Repository: Himotoki.Decodable {
    let id: Int64
    let name: String
    
    static func decode(_ e: Extractor) throws -> Repository {
        return try Repository(
            id: e.value("id"),
            name: e.value("name"))
    }
}

struct SearchResponse<Item: Himotoki.Decodable>: Himotoki.Decodable {
    let items: [Item]
    let totalCount: Int
    
    static func decode(_ e: Extractor) throws -> SearchResponse {
        return try SearchResponse(
            items: e.array("items"),
            totalCount: e.value("total_count"))
    }
}
