//
//  CharacterDetailViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 18.01.2021.
//

import Foundation

class CharacterDetailViewModel : CharacterViewModel {
    override init(character: Character) {
        super.init(character: character)
    }
    
    func getTitle() -> String {
        return "\(self.character.name) \n \(self.getStatusString()) \n \(self.getSpeciesString())"
    }
}
