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
    var collectionViewDataSource = GifListCWDataSource()
    var navBarDelegate = GifListNavBarDelegate()
    var textFieldDelegate = GifListTextFieldDelegate()
    
    var gifListArray = [GifList](){
        didSet{
            
           self.gifListView.gifListCollectionView.dataSource = self.collectionViewDataSource
           self.collectionViewDataSource.objectsArray = self.gifListArray
           self.gifListView.gifListCollectionView.reloadData()
       
            
        }
    }
    
    var gifListGetter = GifListGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    @IBAction func searchGifsAction(_ sender: Any) {
        
        guard let userInput = self.gifListView.searchTextField.text else {return}
        
        switch userInput{
        case "":
            self.gifListArray.removeAll()
            self.gifListView.searchTextField.resignFirstResponder()
        default:
            self.searchGifs(text: userInput)
            self.gifListView.searchTextField.resignFirstResponder()
        }
        
    }
    
}

