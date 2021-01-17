//
//  CharacterCollectionViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation
import UIKit
import Kingfisher

class CharacterCollectionViewModel {
    var character : Character
    var title : String
    
    init(character : Character) {
        self.character = character
        self.title = character.name
    }
    
    func getImageUrl() -> URL{
        guard let url = URL(string: character.image) else {
            fatalError("url problem")
        }
        return url
    }
    
    func getSubtitleString() -> String {
        return "\(getStatusString(status: character.status)) \(getSpeciesString(species: character.species))"
    }
    
    private func getStatusString(status : String) -> String {
        let preText = AppConstants.StringResources.CharacterCell.statusPreText
        switch status {
        case "Alive":
            return "\(preText) :Alive 🟢"
        case "Dead":
            return "\(preText) :Dead ⚫️"
        default:
            return "\(preText) :Unknown ⚪️"
        }
    }
    
    private func getSpeciesString(species : String) -> String {
        let preText = AppConstants.StringResources.CharacterCell.speciesPreText
        switch species {
        case "Human":
            return "\(preText) :👤"
        case "Alien":
            return "\(preText) :👽"
        default:
            return "\(preText) :Unknown"
        }
    }
    
    
}
