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
    private var gifListArray = [GifList](){
        didSet{
            
           self.gifListView.gifListCollectionView.dataSource = self.collectionViewDataSource
           self.collectionViewDataSource.objectsArray = self.gifListArray
           self.gifListView.gifListCollectionView.reloadData()
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldDelegate.delegate = self
        self.gifListView.gifListNavBar.delegate = navBarDelegate
        self.gifListView.searchTextField.delegate = textFieldDelegate
    }
    
   private func searchGifs(text: String){
        
        self.gifListGetter.getGifList(text: text, downloadType: .downloadGifList, completion:{[unowned self] data, error in
            
            if let data = data{
                self.gifListArray = data
            }
            
            if let error = error{
                print(error.localizedDescription)
            }
            
        })
    }
    
}

extension GifListViewController: GifListVCDelegate {
    
    func findGifs(value: String) {
        
        switch value{
        case "":
            self.gifListArray.removeAll()
        default:
            self.searchGifs(text: value)
        }

    }

}

