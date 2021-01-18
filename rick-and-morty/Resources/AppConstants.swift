//
//  AppConstants.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import Foundation
import UIKit

struct AppConstants {
    struct Network {
        static var baseUrl = "https://rickandmortyapi.com/api/"
        static var character = "character"
    }
    
    struct StringResources {
        struct CharacterCell {
            static let statusPreText = "Status"
            static let speciesPreText = "Species"
        }
    }
    
    struct Attributes{
        
        static let fontAttributeTitle = [ NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 32)! ]
        static let fontAttribute = [ NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 20)! ]
    }
}
