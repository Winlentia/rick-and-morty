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
            self.image.kf.setImage(with: viewModel.getImageUrl())
            self.titleLabel.text = viewModel.getTitle()
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
