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
    
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 130, height: 140)

        return layout
    }()
    
    var collectionView: UICollectionView = {
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       collectionView.dataSource = self
       collectionView.delegate = self
       collectionView.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.reuseId)
       return collectionView
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
}

extension CharactersListViewController: CharactersListViewDelegate  {
    func characterWasSelected(_ character: Character) {
        
    }
    
    func schollViewScrolled(offset: Int) {
        
    }
    
    func searchForCharacters(startingWith text: String) {
        
    }
    
    func searchEnded() {
        
    }
    
    
}
