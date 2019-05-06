//
//  GifListTextFieldDelegate.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 30/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

class GifListTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return false
    }
    
}
