//
//  ExerciseRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

struct ExerciseRecord: Identifiable {
    let id = UUID()
    let exerciseEmojiIcon: String
    let exerciseType: String
    let exerciseName: String
    let todayWeight: Double
}
