//
//  APIMahager.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 19/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import Alamofire

class APIManager: ApiMethods{
    
    internal var apiKey: String{
        get{
            return "api_key=iNt1lUL0tXnsnHq9VFwnygaecEp4Niyk"
        }
    }
    
    func loadWithUrl(value: String, downloadOption: ApiRequests, completion: @escaping (Data?, Error?) -> Void) {
        
        let url = makeRequest(downloadOption: downloadOption, value: value)
        
        Alamofire.request(url).responseData(completionHandler:{response in

            completion(response.data, response.error)

        })
    }
}

extension APIManager{
    
    private func makeRequest(downloadOption: ApiRequests, value: String) -> String{
        
        var url = String()
        
        switch downloadOption {
            
        case .downloadGifList:
            
            url = ("https://api.giphy.com/v1/gifs/search?\(apiKey)&q=\(value)&limit=25&offset=0&rating=G&lang=ru")
            
        case .downloadGif:
           
            url = value
            
        }
        
        return url
    }
}
