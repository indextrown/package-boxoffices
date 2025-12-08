//
//  Response.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList: [Movie]
    }
}
