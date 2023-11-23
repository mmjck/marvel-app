//
//  ComicCharactersViewModelProtocol.swift
//  marvel-app
//
//  Created by Jackson Matheus on 21/11/23.
//

import Foundation

protocol ComicCharactersViewModelDelegate: AnyObject {
    func comicCharactersViewModelDelegate(_ viewModel: ComicCharactersViewModel, didLoadCharactersList charactersList: [Character])
    func showError(_ error: NetworkError)
}

protocol ComicCharactersViewDelegate: AnyObject {
    func characterWasSelected(_ character: Character)
}
