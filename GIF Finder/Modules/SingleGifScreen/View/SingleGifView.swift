//
//  SingleGifView.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 13/05/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit
import FLAnimatedImage

class SingleGifView: UIView {

    @IBOutlet weak var animatedImage: FLAnimatedImageView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var titleNavBarItem: UINavigationItem!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var heartToolBarItem: UIBarButtonItem!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func setTitle(title: String){
        
        if title == ""{
            self.titleNavBarItem.title = "title"
        }else{
            self.titleNavBarItem.title = title
        }
        
    }
    
    func setImage(gif: FLAnimatedImage){
        
        self.animatedImage.animatedImage = gif
        //self.animatedImage.contentMode = .scaleToFill
        
    }
    
    func turningOnActivityIndicator(){
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
    }
    
    func turningOffActivityIndicator(){
        
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
        
    }
}
