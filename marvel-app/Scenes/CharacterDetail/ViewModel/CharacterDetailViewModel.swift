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
    
    
    func loadComics(){
        isDataLoading = true
        
        comicsService.fetchComicsForCharacter(id: character?.id ?? 0, offset: comicsCount){ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let comics):
                self.comicsLit.append(contentsOf: comics.data.results)
                self.comicsCount += self.limit
            case .failure(let error):
                self.delegate?.showError(error)
            }
            
            
            self.isDataLoading = false
            
            
        }
    }
}
