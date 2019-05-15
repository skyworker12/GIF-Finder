//
//  GifListVCExtensions.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 13/05/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

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

extension GifListViewController: GifListVCRouter{
    
    func moveToSingleGifScreen(gifParams: GifList) {
        
        guard let singleGifVC = UIStoryboard(name: "SingleGifScreen", bundle: nil).instantiateViewController(withIdentifier: "SingleGif") as? SingleGifViewController else {return}
        
        singleGifVC.gifParams = gifParams
        
        self.present(singleGifVC, animated: true, completion: nil)

    }
    
    
    
    
}
