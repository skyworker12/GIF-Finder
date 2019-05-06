//
//  GifListView.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 25/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GifListView: UIView {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var gifListCollectionView: UICollectionView!
    @IBOutlet weak var gifListNavBar: UINavigationBar!
    
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch? = touches.first
        
        if touch?.view == self || touch?.view != self.gifListNavBar{
            
            self.searchTextField.resignFirstResponder()
            
        }
    }
    
}
