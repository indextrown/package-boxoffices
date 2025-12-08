//
//  Movie.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

// 외부에서 써야하므로 public
/// 영화 정보를 나타내는 구조체
public struct Movie: Decodable, Sendable {
    public let rank: String
    public let code: String
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
}
