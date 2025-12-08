//
//  File.swift
//  BoxOffices
//
//  Created by 김동현 on 12/8/25.
//

import Foundation

// BoxOffices.swift에서 fetchDailyTop10() 안에서만 쓰이므로 internal
extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}
