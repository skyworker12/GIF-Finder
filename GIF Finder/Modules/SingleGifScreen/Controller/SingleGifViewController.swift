//
//  SingleGifViewController.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 13/05/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit
import FLAnimatedImage

class SingleGifViewController: UIViewController {
    
    @IBOutlet var singleGigView: SingleGifView!
    
    var gifParams: GifList?
    
    //MARK: Delegates & DataSources
    var navBarDelegate = NavBarDelegate()
    
    //MARK: Model
    let singleGifGetter = SingleGifGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.singleGigView.navBar.delegate = navBarDelegate
        self.singleGigView.setTitle(title: gifParams!.title)
        
        self.loadImage()

    }
    
    func loadImage(){
        
        self.singleGigView.turningOnActivityIndicator()
        
        self.singleGifGetter.getGif(url: self.gifParams!.url, downloadType: .downloadGif, completion: {[unowned self]
            data, error, url in
            
            if let data = data{
                
                guard let imageData = FLAnimatedImage(animatedGIFData: data) else {return}
                
                self.singleGigView.turningOffActivityIndicator()
                
                self.singleGigView.setImage(gif: imageData)
                
            }
            
            if let error = error{
                
                print(error.localizedDescription)
                
            }
            
        })
        
    }
    
}
