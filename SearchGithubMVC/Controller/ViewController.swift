//
//  ViewController.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/17.
//  Copyright © 2018年 satorun. All rights reserved.
//

import UIKit
import APIKit
import Result


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    private var service: GitHubService!
    
    typealias ServiceResult = Result<SearchResponse<Repository>, GitHubServiceError>
    var result: ServiceResult?
    
    var loading = false
    
    func inject(service: GitHubService) {
        self.service = service
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inject(service: GitHubServiceImpl())
        RepositoryCell.register(to: tableView)
    }

    func search(query: String) {
        service.search(query: query) { [weak self] result in self?.updateView(result: result) }
    }
    
    func updateView(result: ServiceResult) {
        print(result)
        self.result = result
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let result = result else { return 0 }
       switch result {
        case .success(let response):
            return response.items.count
        case .failure(let error):
            switch error {
            case .fail, .nodata:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = result?.items else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier) as! RepositoryCell
        cell.set(repository: items[indexPath.item])
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        search(query: searchText)
    }
}
