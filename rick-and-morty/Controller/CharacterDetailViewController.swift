//
//  CharacterDetailViewController.swift
//  rick-and-morty
//
//  Created by Winlentia on 18.01.2021.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var character : Character?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let char = character {
            let viewModel = CharacterDetailViewModel(character: char)
            self.image.contentMode = .scaleAspectFill
            self.image.kf.setImage(with: viewModel.getImageUrl())
            setupTitleLabel(text: viewModel.getTitle())
            self.title = viewModel.character.name
        }else {
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    fileprivate func setupTitleLabel(text : String){
        let splittedArray = text.split(separator: "\n")
        let attributedString = NSMutableAttributedString()
        for (index,str) in splittedArray.enumerated() {
            if(index == 0){
                attributedString.append(NSAttributedString(string: String("\(str) \n\n"), attributes: AppConstants.Attributes.fontAttributeTitle))
            }else {
                attributedString.append(NSAttributedString(string: String("\(str) \n"), attributes: AppConstants.Attributes.fontAttribute))
            }
        }
        self.titleLabel.attributedText = attributedString
    }
    
}
