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
    private var viewModels: [Character] = []
    weak var delegate: CharactersListViewDelegate?
    
    
    
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 130, height: 140)
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.reuseId)
        return collectionView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadCollectionView(with viewModels: [Character]) {
        self.viewModels = viewModels
        collectionView.reloadData()
    }
    
    func showErrorView(_ error: ErrorViewModel){
        self.addSubview(errorView)
        errorView.errorViewModel = error
        
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            errorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        
        // errorView.fadeIn()

    }
    
    func hideErrorView() {
        // errorView.fadeOut()
        errorView.removeFromSuperview()
        
        collectionView.reloadData()
        searchBar.text = ""    }
}


extension CharactersListView: ViewCode {
    func addSubviews() {
        self.addSubview(searchBar)
        self.addSubview(collectionView)
        
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
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


extension CharactersListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.reuseId, for: indexPath) as? CharacterViewCell else {
            return UICollectionViewCell()
        }
        
        cell.character = viewModels[indexPath.row]
        return cell
    }
}

extension CharactersListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.characterWasSelected(viewModels[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((collectionView.contentOffset.y + collectionView.frame.size.height) >= collectionView.contentSize.height - 200) {
            let offset = collectionView.numberOfItems(inSection: 0)
            delegate?.scrollViewScrolled(offset: offset)
        }
    }
}

extension CharactersListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Não foi possível carregar o flow layout")
        }
        
        let heightProportion: CGFloat = 1.077
        let itemsPerLine: CGFloat = 2
        
        let sectionMargins = flowLayout.sectionInset
        let itemsSpacing = flowLayout.minimumInteritemSpacing
        
        let utilWidth = collectionView.bounds.width - (sectionMargins.left + sectionMargins.right) - itemsSpacing * (itemsPerLine - 1)
        let itemWidth = utilWidth / itemsPerLine
        
        return CGSize(width: itemWidth, height: itemWidth * heightProportion)
    }
}


// MARK: - Search Bar Delegate

extension CharactersListView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        Debounce<String>.input(searchText, comparedAgainst: searchBar.text ?? "") { [weak self] _ in
//            
//            self?.delegate?.isSearching = true
//
//            if searchBar.text == "" {
//                self?.resetSearchbar(searchBar)
//                self?.errorView.removeFromSuperview()
//            } else {
//                self?.errorView.removeFromSuperview()
//                self?.delegate?.searchForCharacters(startingWith: searchText)
//            }
//        }
    }
    
    func resetSearchbar(_ searchBar: UISearchBar) {
        delegate?.isSearching = false
//        collectionView.reloadData()
        searchBar.resignFirstResponder()
        delegate?.searchEnded()
    }
}
