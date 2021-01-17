//
//  HomeViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation

class HomeViewModel {
    var pageData : [Character]?
    
    var apiProvider : RickAndMortyApiProvider
    
    init(apiProvider :  RickAndMortyApiProvider) {
        self.apiProvider = apiProvider
    }
    
    func fetch(completion: @escaping () -> (), onFailure: @escaping (NetworkError) -> ()) {
        self.apiProvider.getCharactersData { (response) in
            self.pageData = response
            completion()
        } onFailure: { (err) in
            onFailure(err)
        }
    }
}
