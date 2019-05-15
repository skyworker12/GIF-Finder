//
//  SingleGifNavBarDelegate.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 14/05/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
class SingleGifNavBarDelegate: NSObject,  UINavigationBarDelegate{
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
