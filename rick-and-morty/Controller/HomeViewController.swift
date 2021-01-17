//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Winlentia on 16.01.2021.
//

import UIKit
import DisplaySwitcher

private let animationDuration: TimeInterval = 0.3

private let listLayoutStaticCellHeight: CGFloat = 80
private let gridLayoutStaticCellHeight: CGFloat = 165

class HomeViewController: BaseViewController {
    
    var viewModel = HomeViewModel(apiProvider: RickAndMortyApi())
    fileprivate var isTransitionAvailable = true
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate lazy var listLayout = DisplaySwitchLayout(
        staticCellHeight: listLayoutStaticCellHeight,
        nextLayoutStaticCellHeight: gridLayoutStaticCellHeight,
        layoutState: .list
    )
    fileprivate lazy var gridLayout = DisplaySwitchLayout(
        staticCellHeight: gridLayoutStaticCellHeight,
        nextLayoutStaticCellHeight: listLayoutStaticCellHeight,
        layoutState: .grid
    )
    fileprivate var layoutState: LayoutState = .list
    
    
    fileprivate func getPageData(_ viewModel: HomeViewModel) {
        // Do any additional setup after loading the view.
        viewModel.fetch {
            //bind data
            self.collectionView.reloadData()
            print(viewModel.pageData)
        } onFailure: { (err) in
            //todo handle error
            print(err)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        getPageData(viewModel)
        setupCollectionView()

    }
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = listLayout
        collectionView.register(CharacterCollectionViewCell.cellNib, forCellWithReuseIdentifier: CharacterCollectionViewCell.id)
    }


}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.pageData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.id,
            for: indexPath
            ) as! CharacterCollectionViewCell
        if layoutState == .grid {
            cell.setupGridLayoutConstraints(1, cellWidth: cell.frame.width)
        } else {
            cell.setupListLayoutConstraints(1, cellWidth: cell.frame.width)
        }
        cell.bind(viewModel: CharacterCollectionViewModel(character: viewModel.pageData![indexPath.row]))
        
        return cell
    }
    
    
}

extension HomeViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                        newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        
        return customTransitionLayout
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isTransitionAvailable = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isTransitionAvailable = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath) {
        //route to  other page
    }
}
