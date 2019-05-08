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
 /*
    func createGestureRecognizer(){
        
        let tap = UIGestureRecognizer(target: self, action: dismissKeyboard(sender: <#T##UIGestureRecognizer#>))
        
        tap.cancelsTouchesInView = false
        
        self.addGestureRecognizer(tap)
    }
    
  @objc private func dismissKeyboard(sender: UIGestureRecognizer){
        self.endEditing(true)
    }*/
}
