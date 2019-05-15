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

class GifListCVDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var objectsArray = [GifList]()
    
    weak var delegate: GifListVCRouter?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let singleGifGetter = SingleGifGetter()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifCell", for: indexPath) as! GifCollectionViewCell
        
        cell.turningOnActivityIndicator()
        cell.gifTitleLabel.text = self.objectsArray[indexPath.row].title
        
        singleGifGetter.getGif(url: self.objectsArray[indexPath.row].url, downloadType: .downloadGif , completion:{
            data, error, url in
            
            if let data = data{
                
                DispatchQueue.main.async {
                    
                    if url == self.objectsArray[indexPath.row].url{
                        
                        let imageData = FLAnimatedImage(animatedGIFData: data)
                        
                        cell.turningOffActivityIndicator()
                        cell.gifAnimatedImage.animatedImage = imageData
                        cell.gifAnimatedImage.contentMode = .scaleToFill
                        
                    }
                }
            }
            
            if let error = error{
                print(error.localizedDescription)
            }
        } )

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.moveToSingleGifScreen(gifParams: self.objectsArray[indexPath.item])
        
    }
    
}
