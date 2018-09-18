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

