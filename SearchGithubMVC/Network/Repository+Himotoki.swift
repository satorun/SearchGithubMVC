//
//  Repository+Himotoki.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/19.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Himotoki

extension Repository: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> Repository {
        return try Repository(
            id: e.value("id"),
            name: e.value("name"))
    }
}

extension SearchResponse: Himotoki.Decodable where Item: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> SearchResponse {
        return try SearchResponse(
            items: e.array("items"),
            totalCount: e.value("total_count"))
    }
}
