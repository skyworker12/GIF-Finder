//
//  ViewController.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 19/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GifListViewController: UIViewController {
    
    @IBOutlet var gifListView: GifListView!
    
    //MARK: delegates & datasources
    var collectionViewDataSource = GifListCVDataSource()
    var navBarDelegate = GifListNavBarDelegate()
    var textFieldDelegate = GifListTextFieldDelegate()
    
    //MARK: model
    var gifListGetter = GifListGetter()
    
    //MARK: self private properties
    internal var gifListArray = [GifList](){
        didSet{
            
           self.gifListView.gifListCollectionView.dataSource = self.collectionViewDataSource
           self.gifListView.gifListCollectionView.delegate = self.collectionViewDataSource
           self.collectionViewDataSource.objectsArray = self.gifListArray
           self.gifListView.gifListCollectionView.reloadData()
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewDataSource.delegate = self
        self.textFieldDelegate.delegate = self
        self.gifListView.gifListNavBar.delegate = navBarDelegate
        self.gifListView.searchTextField.delegate = textFieldDelegate
        
    }
    
   internal func searchGifs(text: String){
        
        self.gifListGetter.getGifList(text: text, downloadType: .downloadGifList, completion:{[weak self] data, error in
            
            if let data = data{
                self?.gifListArray = data
            }
            
            if let error = error{
                self?.creatErrorAlert(error)
            }
            
        })
    }
    
    private func creatErrorAlert(_ error: Error?){
        
        let alertController = UIAlertController(title: "Ошибка", message: error?.localizedDescription, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ок", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}


