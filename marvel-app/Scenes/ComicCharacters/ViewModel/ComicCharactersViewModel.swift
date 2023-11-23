//
//  ComicCharactersViewModel.swift
//  marvel-app
//
//  Created by Jackson Matheus on 21/11/23.
//

import Foundation


final class ComicCharactersViewModel {
    private let limit = 20
    private (set) var charactersCount = 20
    private (set) var isDataLoading = false
    
    weak var delegate: ComicCharactersViewModelDelegate?
    
    
    private let charactersService: FetchCharactersProtocol
    var comic: Comic?
    
    
    
    
    var charactersList: [Character] = [] {
        didSet {
            delegate?.comicCharactersViewModelDelegate(self, didLoadCharactersList: charactersList)
        }
    }
    
    init(charactersService: FetchCharactersProtocol = FetchCharactersService(), comic: Comic){
        
        self.charactersService = charactersService
        self.comic = comic
    }
    
    func loadCharacters(){
        isDataLoading = true
        charactersService.fetchCharactersForComic(id: comic?.id ?? 0, offset: charactersCount) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let characters):
                self.charactersList.append(contentsOf: characters.data.results)
                self.charactersCount += self.limit
            case .failure(let error):
                self.delegate?.showError(error)
            }
            
            
        }
        isDataLoading = false
        
        
        
        
    }
    
}


