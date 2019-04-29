//
//  GifListCWDataSource.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 25/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
import FLAnimatedImage

class GifListCWDataSource: NSObject, UICollectionViewDataSource{
    
    var objectsArray = [GifList]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let singleGifGetter = SingleGifGetter()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifCell", for: indexPath) as! GifCollectionViewCell
        
        cell.gifTitleLabel.text = self.objectsArray[indexPath.row].title
        
        singleGifGetter.getGif(url: self.objectsArray[indexPath.row].url, downloadType: .downloadGif , completion:{
            data, error in
            
            if let data = data{
                DispatchQueue.main.async {
                    
                    let imageData = FLAnimatedImage(animatedGIFData: data)
                    cell.gifAnimatedImage.animatedImage = imageData
                    cell.gifAnimatedImage.contentMode = .scaleToFill
                    
                }
            }
            
            if let error = error{
                print(error.localizedDescription)
            }
        } )

        return cell
    }
    
}
