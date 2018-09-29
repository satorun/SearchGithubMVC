//
//  UITableView+Extensions.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import UIKit


protocol Identifiable {
    static var identifier: String { get }
}
extension Identifiable {
    static var identifier: String { return String(describing: type(of: self)) }
}

extension Identifiable where Self: UITableViewCell {
    static func register(to tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: identifier)
    }
}
