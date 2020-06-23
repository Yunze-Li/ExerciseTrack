//
//  TestDataGenerator.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

class TestDataGenerator {
    
    func getTestExerciseRecord() -> ExerciseRecord {
        return ExerciseRecord(id: .init(), exerciseEmojiIcon:"🏃‍♂️", exerciseType:"Insanity", exerciseName:"05 - Pure Cardio", todayWeight: 83.5)
    }
}
