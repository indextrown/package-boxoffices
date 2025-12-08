//
//  File.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

// APIClient.swift 안에서만 쓰이므로 internal
extension URLRequest {
    init(urlString: String,
         httpMethod: HTTPMethod,
         key: String,
         queryItems: [URLQueryItem]?
    ) throws {
        // URL Components
        guard var compoents = URLComponents(string: urlString) else {
            throw APIError.urlIsInvalid
        }
        
        // Query Items
        compoents.queryItems = [URLQueryItem(name: "key", value: key)]
        if let queryItems {
            compoents.queryItems?.append(contentsOf: queryItems)
        }
        
        // URL Request
        guard let url = compoents.url else {
            throw APIError.urlIsInvalid
        }
        self.init(url: url)
        
        // HTTP Method
        self.httpMethod = httpMethod.capitalizedValue
    }
}
