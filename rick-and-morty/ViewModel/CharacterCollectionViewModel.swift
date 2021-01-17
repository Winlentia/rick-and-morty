//
//  CharacterCollectionViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation
import UIKit

class CharacterCollectionViewModel {
    var character : Character
    var image : UIImage?
    var title : String
    
    init(character : Character) {
        self.character = character
        self.title = character.name
    }
    
    func getStatusString(status : String) -> String {
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
    
    func getSpeciesString(species : String) -> String {
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
