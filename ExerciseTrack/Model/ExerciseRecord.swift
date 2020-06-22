//
//  ExerciseRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

// Value of binding must be value tupe, which is enum or struct
struct ExerciseRecord: Identifiable {
    let id: UUID
    var exerciseEmojiIcon: String
    var exerciseType: String
    var exerciseName: String
    var todayWeight: Double
}
