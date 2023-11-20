//
//  CharacterDetailViewController.swift
//  marvel-app
//
//  Created by Jackson Matheus on 20/11/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    
    private lazy var characterDetailView: CharacterDetailView = {
        let view = CharacterDetailView(character: viewModel?.character)
        view.delegate = self
        return view
    }()
    
    
    var viewModel: CharacterDetailViewModel?

    
    init(viewModel: CharacterDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = characterDetailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
  

    private func initialSetup() {
        setupNavBar()
        
        viewModel?.delegate = self
        viewModel?.loadComics()
    }

    
    
    private func setupNavBar() {
        self.navigationController?.view.tintColor = .black
        self.navigationItem.title = viewModel?.character?.name
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        let backButton = UIBarButtonItem()
        backButton.title = " "
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

// MARK: - Character Detail View Delegate

extension CharacterDetailViewController: CharacterDetailViewDelegate {
    func comicWasSelected(_ comic: Comic) {
        // let comicViewModel = ComicCharactersViewModel(comic: comic)
        // let detailVC = ComicCharactersViewController(viewModel: comicViewModel)
        // navigationController?.pushViewController(detailVC, animated: true)
    }

}


extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    
    func characterDetailViewModelDelegate(_ viewModel: CharacterDetailViewModel, didLoadComicsList comicsList: [Comic]) {
       characterDetailView.loadCollectionView(with: comicsList)
    }
    
    func showError(_ error: NetworkError) {
       //  let errorVM = error.getErrorViewModel { [weak self] in
        //     self?.characterDetailView.hideErrorView()
        //     self?.viewModel?.loadComics()
        // }
        
        //characterDetailView.showErrorView(errorVM)
    }
}

