//
//  APIMahager.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 19/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import Alamofire

//"https://api.giphy.com/v1/gifs/search?api_key=iNt1lUL0tXnsnHq9VFwnygaecEp4Niyk&q=cat&limit=25&offset=0&rating=G&lang=en"

class APIManager: ApiMethods{
    
    func loadWithUrl(value: String, downloadOption: ApiRequests, completion: @escaping (Data?, Error?) -> Void) {
        
        guard let url = URL(string: makeRequest(downloadOption: downloadOption, value: value)) else {return}
        
        Alamofire.request(url).responseData(completionHandler:{data in
            completion(data.data, data.error)
        })
    }
}

extension APIManager{
    
    private var urlResourse: String{
        get{
            return "https://api.giphy.com/v1/gifs/search?"
        }
    }
    
    private var apiKey: String{
        get{
            return "api_key=iNt1lUL0tXnsnHq9VFwnygaecEp4Niyk&q"
        }
    }
    
    private var searchValue: String{
        get{
            return "&q="
        }
    }
    
    private var limit: String{
        get{
            return "&limit=25"
        }
    }
  
    private var offset: String{
        get{
            return "&offset=0"
        }
    }
    
    private var rating: String{
        get{
            return "&rating=G"
        }
    }
    
    private var language: String{
        get{
            return "&lang=ru"
        }
    }
    
    private func createUrl(value: String) -> String{
        
        let url = urlResourse + apiKey + searchValue + value + limit + offset + rating + language
        
        return url
    }
    
    private func makeRequest(downloadOption: ApiRequests, value: String) -> String{
        
        var url = String()
        
        switch downloadOption {
            
        case .downloadGifList:
            
            url = createUrl(value: value)
            
        case .downloadGif:
           
            url = value
            
        }
        
        return url
    }
}
