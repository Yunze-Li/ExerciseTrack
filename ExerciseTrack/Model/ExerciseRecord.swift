//
//  ExerciseRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 25/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

// Value of binding must be value type, which is enum or struct
struct ExerciseRecord: Identifiable {
    let id: String
    let date: Date
    var exerciseEmojiIcon: String
    var exerciseType: String
    var exerciseName: String
    var todayWeight: String

    func getWeightValue() -> Double {
        return Double(todayWeight)!
    }
}
