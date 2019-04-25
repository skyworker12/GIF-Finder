//
//  GifListGetter.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 23/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation

class GifListGetter: GifsGetter {
    
    var apiManager = APIManager()
    
    func getGifList(text: String, downloadType: ApiRequests, completion: @escaping ([GifList]?, Error?) -> ()){
        
        self.apiManager.loadWithUrl(value: text, downloadOption: .downloadGifList, completion:{data, error in

            let decoder = JSONDecoder()
    
            do{
                let jsonArray = try decoder.decode(GifListJSON.self, from: data!)
                
                let gifArray = jsonArray.data.compactMap{GifList(title: $0.title , url: $0.images.fixedHeight.url)}
                
                //print(gifArray)
                
                completion(gifArray, error)
                
            }catch{
                
                completion(nil, error)
                
            }
        })
    }
}

