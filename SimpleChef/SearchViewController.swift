//
//  SearchViewController.swift
//  SimpleChef
//
//  Created by Thanasi Stratigakis on 10/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.hidesNavigationBarDuringPresentation = false
        search.dimsBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        search.delegate = self
        search.searchBar.delegate = self
        self.definesPresentationContext = true
        
        search.searchBar.keyboardAppearance = .light
        search.searchBar.placeholder = "Search"
        search.searchBar.isHidden = false
        search.isActive = false
        
        return search
    }()
    
    var searchResultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchController()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
    }

    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        self.navigationItem.titleView = self.searchController.searchBar
    }
    
    func setupTableView() {
        self.view.addSubview(searchResultsTableView)
        searchResultsTableView.snp.makeConstraints { (make) in
            //make.top.equalTo(self.searchController.searchBar.snp.bottom)
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // segue
    }
}

extension SearchViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        //nothing
    }
    
}
