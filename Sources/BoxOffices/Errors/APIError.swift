//
//  APIError.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

// APIClient.swift에서 인터페이스 함수에서 실패시 에러를 리턴해야하므로 public이어야함
public enum APIError: Error {
    case urlIsInvalid
    case responseIsNotExpected
    case requestIsInvalid(_ statusCode: Int)
    case serverIsNotResponding(_ statusCode: Int)
    case responseIsUnsuccessful(_ statusCode: Int)
}

extension APIError {
    // APIClient.swift에서 접근해야 하므로 internal
    // 성공시 에러를 반환하지 않고 nil 리턴
    init?(httpResponse: HTTPURLResponse?) {
        // HTTP URL Response
        guard let httpResponse else {
            self = APIError.responseIsNotExpected
            return
        }
        
        switch httpResponse.statusCode {
        case 200..<300: return nil
        case 400..<500: self = APIError.requestIsInvalid(httpResponse.statusCode)
        case 500..<600: self = APIError.serverIsNotResponding(httpResponse.statusCode)
        default: self = APIError.responseIsUnsuccessful(httpResponse.statusCode)
        }
    }
}
