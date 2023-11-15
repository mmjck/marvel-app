//
//  CharactersListViewModelProtocol.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation
protocol CharactersListViewDelegate: AnyObject {
    var isSearching: Bool { get set }
    func characterWasSelected(_ character: Character)
    func schollViewScrolled(offset: Int)
    func searchForCharacters(startingWith text: String)
    func searchEnded()
}


protocol CharactersListViewModelDelegate: AnyObject {
    func charactersListViewModelDelegate(_ viewModel: CharactersListViewModel, didLoadCharactersList charactersList: [Character])
    
    func charactersListViewModelDelegate(_ viewModel: CharactersListViewModel, didSearchForCharacters charactersList: [Character])
    
    func showError(_ error: NetworkError)
}
