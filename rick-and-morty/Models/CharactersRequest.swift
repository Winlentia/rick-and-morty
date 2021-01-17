//
//  CharactersRequest.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation

struct CharactersRequest : Codable {
    var info : Info
    var results : [Character]
}
