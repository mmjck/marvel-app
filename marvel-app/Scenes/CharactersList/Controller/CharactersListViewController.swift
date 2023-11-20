//
//  CharactersListViewController.swift
//  marvel-app
//
//  Created by Jackson Matheus on 15/11/23.
//

import Foundation
import UIKit

final class CharactersListViewController: UIViewController{
    
    
    private var viewModel: CharactersListViewModel?
    var isSearching: Bool = false
    
    private lazy var charactersListView: CharactersListView = {
        let view = CharactersListView()
        
        view.delegate = self
        return view
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(viewModel: CharactersListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    
    override func loadView() {
        super.loadView()
        
        self.view = charactersListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        setupNavBar()
        
        viewModel?.delegate = self
        viewModel?.loadCharacters()
    }
    
    private func setupNavBar(){
        self.navigationController?.view.tintColor = .red
        self.navigationItem.title = "Marvel"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        let backButton = UIBarButtonItem()
        backButton.title = " "
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
}

extension CharactersListViewController: CharactersListViewDelegate  {
    func scrollViewScrolled(offset: Int) {
        guard let viewModel = viewModel  else { return }
        
        
        if !viewModel.isDataLoading {
            isSearching ? viewModel.searchForCharacters(offset: offset) : viewModel.loadCharacters()
        }
    }
    func characterWasSelected(_ character: Character) {
        let characterDetailViewModel = CharacterDetailViewModel(character: character)
        let detailVC = CharacterDetailViewController(viewModel: characterDetailViewModel)
        
        navigationController?.pushViewController(detailVC, animated: false)
    }
    
    func searchForCharacters(startingWith text: String) {
        viewModel?.searchForCharacters(startingWith: text)
        
    }
    
    func searchEnded() {
        if let charactersList = viewModel?.charactersList {
            charactersListView.loadCollectionView(with: charactersList)
        }
        else {
            viewModel?.loadCharacters()
        }
    }
    
    
}


extension CharactersListViewController: CharactersListViewModelDelegate {
    func charactersListViewModelDelegate(_ viewModel: CharactersListViewModel, didLoadCharactersList charactersList: [Character]) {
        
        charactersListView.loadCollectionView(with: charactersList)
    }
    
    func charactersListViewModelDelegate(_ viewModel: CharactersListViewModel, didSearchForCharacters charactersList: [Character]) {
        
        DispatchQueue.main.async { [weak self] in
            guard let isSearching = self?.isSearching, isSearching else { return }
            
            if charactersList.isEmpty {
                let error = NetworkError.emptySearch.getErrorViewModel { [weak self] in
                    self?.isSearching = false
                    self?.charactersListView.hideErrorView()
                }
                
                self?.charactersListView.showErrorView(error)
            } else {
                self?.charactersListView.loadCollectionView(with: charactersList)
            }
        }
    }
    
    func showError(_ error: NetworkError) {
        let errorVM = error.getErrorViewModel { [weak self] in
            self?.charactersListView.hideErrorView()
            self?.viewModel?.loadCharacters()
            
        }
        
        charactersListView.showErrorView(errorVM)
        
    }
    
}
