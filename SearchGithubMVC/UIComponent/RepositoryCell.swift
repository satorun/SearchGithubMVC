//
//  RepositoryCell.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import UIKit


class RepositoryCell: UITableViewCell, Identifiable {
    @IBOutlet var repositoryStack: UIStackView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func prepareForReuse() {
        isSelected = false
    }
    
    func set(repository: Repository) {
        fullNameLabel.text = repository.fullName
    }
}

