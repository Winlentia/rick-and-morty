//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Winlentia on 16.01.2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        
        var viewModel = HomeViewModel(apiProvider: RickAndMortyApi())
        
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
        viewModel.fetch {
            //bind data
            print(viewModel.pageData)
        } onFailure: { (err) in
            //todo handle error
            print(err)
        }


    }


}

