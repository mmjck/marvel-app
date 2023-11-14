//
//  CharactersListViewModel.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation

class CharactersListViewModel {
    private let limit = 20
    private(set) var charactersCount = 0
    private(set) var isDataLoading = false
    
    var searchText = ""
    var searchCall = 0
    var searchCompleted = 0
    
    weak var delegate: CharactersListViewModelDelegate
    
    private let charactersService: FetchCharactersProtocol
    
    
    
    private(set) var charactersList: 
}
