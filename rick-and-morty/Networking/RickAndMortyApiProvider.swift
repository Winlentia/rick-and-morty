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
