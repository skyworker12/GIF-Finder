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
    
    //MARK: используем делегат, чтобы передать значение textfield и "запустить" поиск GIF.
    weak var delegate: GifListVCDelegate?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let userInput = textField.text else {return false}
        
        delegate?.findGifs(value: userInput)
        
        textField.resignFirstResponder()
        
        return false
    }
    
}
