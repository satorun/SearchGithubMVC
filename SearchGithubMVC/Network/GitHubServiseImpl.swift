//
//  GitHubServise+Himotoki.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Himotoki
import Result
import APIKit

class GitHubServiceImpl: GitHubService {
    func search(query: String, completion:@escaping (Result<SearchResponse<Repository>, GitHubServiceError>) -> ()) {
        typealias Request = GitHubAPI.SearchRepositoriesRequest
        Session.cancelRequests(with: Request.self)
        Session.send(Request(query: query)) { result in
            switch result {
            case .success(let response):
                if response.items.count <= 0 {
                    completion(.failure(.nodata))
                } else {
                    completion(Result.success(response))
                }
            case .failure(let error):
                print(error)
                completion(.failure(.fail))
            }
        }
    }
}
