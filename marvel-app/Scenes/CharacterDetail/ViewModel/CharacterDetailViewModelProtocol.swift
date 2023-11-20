//
//  CharacterDetailViewModelProtocol.swift
//  marvel-app
//
//  Created by Jackson Matheus on 20/11/23.
//

import Foundation

protocol CharacterDetailViewDelegate: AnyObject {
    func comicWasSelected(_ comic: Comic)
}

protocol CharacterDetailViewModelDelegate: AnyObject {
    func characterDetailViewModelDelegate(_ viewModel: CharacterDetailViewModel, didLoadComicsList comicsList: [Comic])
    func showError(_ error: NetworkError)
}
