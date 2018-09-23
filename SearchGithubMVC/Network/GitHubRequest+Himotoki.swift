//
//  Repository+Himotoki.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/19.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Himotoki


extension GitHubRequest where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}

extension Repository: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> Repository {
        return try Repository(
            id: e.value("id"),
            name: e.value("name"),
            fullName: e.value("full_name"),
            owner: e.value(["owner"]),
            htmlUrl:  URLTransformer.apply(e.value("html_url"))!,
            language: e.valueOptional("language")
        )
    }
}

extension Repository.Owner: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> Repository.Owner {
        return try Repository.Owner(login: e.value("login"))
    }
}

extension SearchResponse: Himotoki.Decodable where Item: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> SearchResponse {
        return try SearchResponse(
            items: e.array("items"),
            totalCount: e.value("total_count"))
    }
}

extension Himotoki.Decodable {
    static var URLTransformer: Transformer<String, URL?> {
        return Transformer<String, URL?> { urlString throws -> URL in
            if let url = URL(string: urlString) {
                return url
            }
            throw customError("Invalid URL string: \(urlString)")
        }
    }
}
