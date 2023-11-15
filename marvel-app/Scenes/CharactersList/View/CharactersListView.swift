//
//  CharactersListView.swift
//  marvel-app
//
//  Created by Jackson Matheus on 15/11/23.
//

import Foundation
import UIKit

class CharactersListView: UIView {
    private lazy var errorView =  ErrorView()
    private var viewModels: [Character] = [ ]
    weak var delegate: CharactersListViewDelegate?
    
    
    
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CharactersListView: ViewCode {
    func addSubviews() {
        self.addSubview(searchBar)
    }
    
    func additionalConfig() {
        self.backgroundColor = .systemBackground
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
//            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
//            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
