//
//  CellProtocol.swift
//  rick-and-morty
//
//  Created by Winlentia on 17.01.2021.
//

import UIKit

protocol CellInterface {
    
    static var id: String { get }
    static var cellNib: UINib { get }
    
}

extension CellInterface {
    
    static var id: String {
        return String(describing: Self.self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
}
