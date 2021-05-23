//
//  SearchViewController.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var search = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        setupSearchbar()
    }

    private func setupSearchbar() {
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        search.searchBar.placeholder = "Search GitHub"
        let textFieldInsideSearchBar = search.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }

}

