//
//  RickAndMortyApi.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation

struct RickAndMortyApi : RickAndMortyApiProvider {
    func getCharactersData(onSuccess: @escaping ([Character]) -> (), onFailure: @escaping (NetworkError) -> ()) {
        let requestUrl = NetworkEndpoints.character.url
        
        guard let url = URL(string: requestUrl) else {
            fatalError("url  failure")
        }
        
        NetworkManager().requestAf(url: url, type: CharactersRequest.self) { (response) in
            onSuccess(response.results)
        } onFailure: { (err) in
            onFailure(err)
        }

    }
    
    
}
