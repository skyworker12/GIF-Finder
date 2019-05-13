//
//  GifListNavBarDataSource.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 29/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

class GifListNavBarDelegate: NSObject,  UINavigationBarDelegate{
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
