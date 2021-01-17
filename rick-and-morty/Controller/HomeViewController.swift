//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Winlentia on 16.01.2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
        var api = RickAndMortyApi()
        
        api.getCharactersData { (result) in
            print(result)
        } onFailure: { (err) in
            print(err)
        }

    }


}

