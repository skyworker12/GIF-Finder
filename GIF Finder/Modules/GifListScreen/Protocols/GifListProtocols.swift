//
//  GifListProtocols.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 24/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import FLAnimatedImage

protocol GifsGetter {
    
    func getGifList(text: String, downloadType: ApiRequests, completion: @escaping ([GifList]?, Error?) -> ())
    
}

protocol GifGetter{
    
    func getGif(url: String, downloadType: ApiRequests, completion: @escaping (Data?, Error?, String) -> ())
    
}

protocol GifListVCDelegate: NSObject{
    
    func findGifs(value: String)
    
}

protocol GifListVCRouter: NSObject{
    
    func moveToSingleGifScreen(imageUrl: String, imageTitle: String)
    
}
