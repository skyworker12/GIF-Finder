//
//  Protocols.swift
//  GIF Finder
//
//  Created by Никита Кудряков on 22/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation

protocol ApiMethods{
    func loadWithUrl(value: String, downloadOption: ApiRequests, completion: @escaping (Data?, Error?) -> Void)
}
