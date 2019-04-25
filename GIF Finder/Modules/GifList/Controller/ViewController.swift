//
//  ViewController.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 19/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit
import FLAnimatedImage


class ViewController: UIViewController {
    
    @IBOutlet weak var imageOne: FLAnimatedImageView!
    
    var gifListArray = [GifList](){
        didSet{
            
            print("тут")
            let urlString = self.gifListArray[1].url
            let url = URL(string: urlString)!
            let gifData = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
    
                let imageData = FLAnimatedImage(animatedGIFData: gifData)
                self.imageOne.animatedImage = imageData
                
            }
        }
    }
    
    var model = GifListGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.model.getGifList(text: "dog", downloadType: .downloadGifList, completion:{ data, error in
          self.gifListArray = data!
        })
    }

}

