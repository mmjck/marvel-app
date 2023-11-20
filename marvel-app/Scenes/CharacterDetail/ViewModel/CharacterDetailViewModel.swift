//
//  CharacterDetailViewModel.swift
//  marvel-app
//
//  Created by Jackson Matheus on 20/11/23.
//

import Foundation


class CharacterDetailViewModel {
    private let limit = 20
    private (set) var comicsCount = 0
    private (set) var isDataLoading = false
    
    weak var delegate: CharacterDetailViewModelDelegate?
    
    
    private let comicsService: FetchComicsProtocol
    var character: Character?

    
    var comicsLit: [Comic] = [] {
        didSet {
            delegate?.characterDetailViewModelDelegate(self, didLoadComicsList: comicsLit)
        }
    }
    
    
    init(comicsService: FetchComicsProtocol = FetchComicsService(), character: Character) {
        self.comicsService = comicsService
        self.character = character
    }
    
}
