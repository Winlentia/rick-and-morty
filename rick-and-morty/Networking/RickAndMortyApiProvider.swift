//
//  RickAndMortyApiProvider.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation

protocol RickAndMortyApiProvider {
    func getCharactersData(onSuccess: @escaping (_ result : [Character]) -> (),
                           onFailure: @escaping (_ error : NetworkError) -> ())
}

enum RickAndMortyApiEndpoints {
    case character
    case characterDetail(id : Int)
    
    var url : String {
        switch self {
        case .character:
            return AppConstants.Network.baseUrl + AppConstants.Network.character
        case  .characterDetail(let id):
            return AppConstants.Network.baseUrl + AppConstants.Network.character + "/\(id)"
        }
    }
}
