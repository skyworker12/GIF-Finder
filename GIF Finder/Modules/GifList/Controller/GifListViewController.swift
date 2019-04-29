//
//  ViewController.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 19/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit
import FLAnimatedImage


class GifListViewController: UIViewController {
    
    @IBOutlet var gifListView: GifListView!
    
    var collectionViewDataSource = GifListCWDataSource()
    var navBarDelegate = GifListNavBarDelegate()
    
    var gifListArray = [GifList](){
        didSet{
            
           self.gifListView.gifListCollectionView.dataSource = self.collectionViewDataSource

           self.collectionViewDataSource.objectsArray = self.gifListArray
           self.gifListView.gifListCollectionView.reloadData()
            
        }
    }
    
    var model = GifListGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gifListView.gifListNavBar.delegate = navBarDelegate
        self.gifListView.searchTextField.delegate = self
    }
    
    func searchGifs(text: String){
        
        self.model.getGifList(text: text, downloadType: .downloadGifList, completion:{[unowned self] data, error in
            
            if let data = data{
                self.gifListArray = data
            }
            
            if let error = error{
                print(error.localizedDescription)
            }
            
        })
    }

    @IBAction func searchGifsAction(_ sender: Any) {
        
        self.searchGifs(text: self.gifListView.searchTextField.text!)
    }
}

