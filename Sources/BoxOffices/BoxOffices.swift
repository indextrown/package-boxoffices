// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// open          - 모듈 외부에서 접근 가능, 오버라이딩 가능(UIViewController, viewDidLoad)
// public        - 모듈 외부에서 접근 가능, 오버라이딩 불가
// internal      - 같은 모듈 안에서 어디서나 접근 가능, 모듈 밖에서는 접근 불가
// filePrivate   - 서로 다른 선언부여도 같은 파일이면 접근 가능
// private       - 같은 파일에 있어도 같은 선언부이거나 그 선언부의 확장에서만 접근 가능

/**
 
 */

/// 박스오피스 관련 퍼블릭 인터페이스를 제공하는 메인 클래스
public class BoxOffices {
    // 외부 노출 X
    private let apiClient: APIClient
    
    // 외부 노출 O
    /// 영화진흥원에서 발급 받은 API 키
    public var apiKey: String {
        apiClient.key
    }
    
    /// ``BoxOffices/BoxOffices`` 객체를 생성합니다
    /// - Parameter key: 영화 진흥위원회에서 발급받은 API 키
    public init(key: String) {
        self.apiClient = APIClient(key: key)
    }
    
    // public interface: 모듈 외부에서 사용 목적
    /// 박스오피스 일별 탑 10 영화를 가져옵니다.
    /// - Returns: 성공시 ``Movie`` 타입의 영화 10개, 실패시 에러를 제공하는 `Result 객체.`
    /// ```swift
    /// let result = await boxOffices.fetchDailyTop10()
    /// switch result {
    /// case .success(let movies):
    ///     // Movie 객체 10개
    /// case .failure(let error):
    ///     // 에러 처리
    /// }
    /// ```
    public func fetchDailyTop10() async throws -> [Movie] {
        // Yesterday
        guard let yesterday = Date().yesterday else {
            throw BoxOfficeError.recentDateIsInvalid
        }
        
        // 날짜 형식: yyyymmdd
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let targetDate = dateFormatter.string(from: yesterday)
        
        // API 요청 & 응답
        let response: BoxOfficeResponse = try await apiClient.fetch(path: "boxoffice/searchDailyBoxOfficeList.json",
                                                                    hTTPMethod: .get, queryItems: [URLQueryItem(name: "targetDt",
                                                                                                                value: targetDate)]
        )
        return response.boxOfficeResult.dailyBoxOfficeList
    }
}
