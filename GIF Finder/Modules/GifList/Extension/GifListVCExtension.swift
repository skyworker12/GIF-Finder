//
//  GifListVCExtension.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 26/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

extension GifListViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.gifListView.searchTextField.resignFirstResponder()
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let inputText = textField.text else {return false}
        
        if inputText.count > 1{
            
            self.searchGifs(text: inputText)
            
        }
        
        return true
    }
    
}
