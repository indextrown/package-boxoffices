//
//  File.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

// @testable: 우리가 테스트 하려는 타겟의 모듈 내의 internal 코드까지 접근할 수 있게 해준다

import XCTest
@testable import BoxOffices

final class APIClientTests: XCTestCase {
    func test_fetch() async throws {
        // http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=82ca741a2844c5c180a208137bb92bd7&targetDt=20120101
        
        // http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=91c037fce2fcb7481f8b8022c4bdc25a&targetDt=20120101
        
        
        struct Response: Decodable {
            let boxOfficeResult: BoxOfficeResult
            
            struct BoxOfficeResult: Decodable {
                let dailyBoxOfficeList: [DailyBoxOffice]
                
                struct DailyBoxOffice: Decodable {
                    let movieCd: String
                }
            }
        }
        
        let apiClient = APIClient(key: "91c037fce2fcb7481f8b8022c4bdc25a")
        let response: Response = try await apiClient.fetch(path: "boxoffice/searchDailyBoxOfficeList.json",
                                                           hTTPMethod: .get,
                                                           queryItems: [URLQueryItem(name: "targetDt", value: String?.some("20210101"))]
        )
        XCTAssertEqual(response.boxOfficeResult.dailyBoxOfficeList.count, 10)
    }
}
