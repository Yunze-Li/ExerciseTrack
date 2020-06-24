//
//  TimeUtil.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 24/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

class TimeUtil {
    static func convertTimestampToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
