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
    
    var url = "https://media0.giphy.com/media/l4FGKMDAn0EZKuZIk/200.gif"
    
    var api = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        setImage()
    }

    func setImage(){
        api.loadWithUrl(urlResourse: url, completion:{[weak self] data, error in
            if let error = error{
                print(error.localizedDescription)
            }else if let data = data{
                DispatchQueue.main.async {
                    let imageData = FLAnimatedImage(animatedGIFData: data)
                    self?.imageOne.animatedImage = imageData
                }
            }
            
        })
    }

}

