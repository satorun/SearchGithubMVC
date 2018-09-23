//
//  GitHubService.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Result

enum GitHubServiceError:Error {
    case nodata
    case fail
}

protocol GitHubService {
    func search(query: String, completion:(@escaping (Result<SearchResponse<Repository>, GitHubServiceError>) -> ()))
}
