//
//  SingleGifGetter.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 29/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation

class SingleGifGetter: GifGetter{
    
   var apiManager = APIManager()
    
    func getGif(url: String, downloadType: ApiRequests, completion: @escaping (Data?, Error?, String) -> ()){
        
        self.apiManager.loadWithUrl(value: url, downloadOption: downloadType, completion: { data, error in
            
            completion(data, error, url)
            
        })
    }
}
