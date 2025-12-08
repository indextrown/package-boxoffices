//
//  File.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

enum HTTPMethod: String {
    case get // ,post, delete, put
    
    var capitalizedValue: String {
        self.rawValue.capitalized // ".get" -> "GET"
    }
}

