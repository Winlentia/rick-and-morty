//
//  CharacterViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 18.01.2021.
//

import Foundation

class CharacterViewModel {
    var character : Character
    
    init(character : Character) {
        self.character = character
    }
    
    internal func getStatusString() -> String {
        let preText = AppConstants.StringResources.CharacterCell.statusPreText
        switch self.character.status {
        case "Alive":
            return "\(preText) :Alive 🟢"
        case "Dead":
            return "\(preText) :Dead ⚫️"
        default:
            return "\(preText) :Unknown ⚪️"
        }
    }
    
    internal func getSpeciesString() -> String {
        let preText = AppConstants.StringResources.CharacterCell.speciesPreText
        switch self.character.species {
        case "Human":
            return "\(preText) :👤"
        case "Alien":
            return "\(preText) :👽"
        default:
            return "\(preText) :Unknown"
        }
    }
    
    internal func getImageUrl() -> URL{
        guard let url = URL(string: character.image) else {
            fatalError("url problem")
        }
        return url
    }
}
