//
//  GifCollectionViewCell.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 25/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit
import FLAnimatedImage

class GifCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifAnimatedImage: FLAnimatedImageView!
    @IBOutlet weak var gifTitleLabel: UILabel!
    @IBOutlet weak var gifActivityIndicator: UIActivityIndicatorView!
    
    func turningOnActivityIndicator(){
        
        self.gifActivityIndicator.isHidden = false
        self.gifActivityIndicator.startAnimating()
        
    }
    
    func turningOffActivityIndicator(){
        
        self.gifActivityIndicator.isHidden = true
        self.gifActivityIndicator.stopAnimating()
        
    }
    
}
