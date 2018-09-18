//
//  ViewController.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/17.
//  Copyright © 2018年 satorun. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var response: SearchResponse<Repository>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        search(query: "swift")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func search(query: String) {
        let request = GitHubAPI.SearchRepositoriesRequest(query: query)
        Session.send(request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.updateView(data: response)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    func updateView(data: SearchResponse<Repository>) {
        response = data
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = response?.items[indexPath.item].name
        return cell
    }
}

