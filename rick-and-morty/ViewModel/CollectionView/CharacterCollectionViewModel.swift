//
//  CharacterCollectionViewModel.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation
import UIKit
import Kingfisher

class CharacterCollectionViewModel : CharacterViewModel {
    
    var title : String
    
    override init(character : Character) {
        self.title = character.name
        super.init(character: character)
    }
    
    func getSubtitleString() -> String {
        return "\(getStatusString()) \(getSpeciesString())"
    }

}
