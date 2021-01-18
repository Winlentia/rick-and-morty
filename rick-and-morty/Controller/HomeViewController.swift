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
private let gridLayoutStaticCellHeight: CGFloat = 180

class HomeViewController: UIViewController {
    
    var viewModel = HomeViewModel(apiProvider: RickAndMortyApi())
    fileprivate var isTransitionAvailable = true
    
    
    @IBOutlet weak var rotationButton: SwitchLayoutButton!
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
        viewModel.fetch {
            //bind data
            self.collectionView.reloadData()
        } onFailure: { (err) in
            //todo handle error
            print(err)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        rotationButton.isSelected = true
        getPageData(viewModel)
        setupCollectionView()
        

    }
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = listLayout
        collectionView.register(CharacterCollectionViewCell.cellNib, forCellWithReuseIdentifier: CharacterCollectionViewCell.id)
    }

    @IBAction func changeLayoutPressed(_ sender: Any) {
        if !isTransitionAvailable {
            return
        }
        let transitionManager: TransitionManager
        if layoutState == .list {
            layoutState = .grid
            transitionManager = TransitionManager(
                duration: animationDuration,
                collectionView: collectionView!,
                destinationLayout: gridLayout,
                layoutState: layoutState
            )
        } else {
            layoutState = .list
            transitionManager = TransitionManager(
                duration: animationDuration,
                collectionView: collectionView!,
                destinationLayout: listLayout,
                layoutState: layoutState
            )
        }
        transitionManager.startInteractiveTransition()
        rotationButton.isSelected = layoutState == .list
        rotationButton.animationDuration = animationDuration
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
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = mainStoryBoard.instantiateViewController(withIdentifier: "CharacterDetailViewControllerIdentity") as! CharacterDetailViewController
        detailViewController.character = self.viewModel.pageData![indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
