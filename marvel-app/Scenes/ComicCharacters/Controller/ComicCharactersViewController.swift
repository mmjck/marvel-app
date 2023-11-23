//
//  ComicCharactersViewController.swift
//  marvel-app
//
//  Created by Jackson Matheus on 22/11/23.
//

import UIKit

class ComicCharactersViewController: UIViewController {
    
    private lazy var comicCharactersView: ComicCharactersView = {
        let view = ComicCharactersView()
        
        view.delegate = self
        return view
    }()
    
    var viewModel: ComicCharactersViewModel?
    
    init(viewModel: ComicCharactersViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = ComicCharactersView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    private func initialSetup(){
        setupNavBar()
        
        
        viewModel?.delegate = self
        viewModel?.loadCharacters()
    }
    
    
    
    private func setupNavBar() {
        self.navigationController?.view.tintColor = .red
        self.navigationItem.title = "Personagens"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        let backButton = UIBarButtonItem()
        backButton.title = " "
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
}


extension ComicCharactersViewController: ComicCharactersViewDelegate {
    func characterWasSelected(_ character: Character) {
        //        let descriptionVC = CharacterDescriptionViewController(character: character)
        //
        //        navigationController?.pushViewController(descriptionVC, animated: true)
        
    }
}

extension ComicCharactersViewController: ComicCharactersViewModelDelegate {
    func comicCharactersViewModelDelegate(_ viewModel: ComicCharactersViewModel, didLoadCharactersList charactersList: [Character]) {
        comicCharactersView.loadCollectionView(with: charactersList)
    }
    func showError(_ error: NetworkError) {
        let view = error.getErrorViewModel {
            [weak self] in
            self?.comicCharactersView.hideErrorView()
            self?.viewModel?.loadCharacters()
        }
        
        comicCharactersView.showErrorView(view)
        
    }
}

