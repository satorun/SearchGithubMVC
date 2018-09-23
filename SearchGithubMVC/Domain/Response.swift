//
//  Response.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import Foundation
import Result


protocol Response {
    associatedtype Item
    var items: [Item] { get set }
}

extension Result where T: Response {
    var items: [T.Item]? {
        guard case .success(let response) = self else { return nil }
        return response.items
    }
}
