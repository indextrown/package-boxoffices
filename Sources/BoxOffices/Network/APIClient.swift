//
//  File.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

class APIClient {
    private let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response: Decodable>(
        path: String, // boxoffice/searchDailyBoxOfficeList.xml
        hTTPMethod: HTTPMethod,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Response {
        // URL Request 생성
        let urlRequest = try URLRequest(urlString: "\(baseURL)/\(path)",
                                    httpMethod: hTTPMethod,
                                    key: key,
                                    queryItems: queryItems)
        
        // URLSession data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        // HTTP URL Response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse) {
            throw error
        }
        
        // Decoding
        let output = try JSONDecoder().decode(Response.self, from: data)
        return output
    }
}
