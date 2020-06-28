//
//  TestDataGenerator.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

class TestDataUtil {
    
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    func getPreviewExerciseRecord() -> ExerciseRecord {
        return ExerciseRecord(id: UUID().uuidString, date: .init(), exerciseEmojiIcon: "🏃‍♂️", exerciseType: "Insanity", exerciseName: "06 - Cardio Abs", todayWeight: "83.5")
    }
    
    func getPreviewExerciseRecords() -> [ExerciseRecord] {
        return [
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-23")!, exerciseEmojiIcon:"🏃‍♂️", exerciseType:"Insanity", exerciseName:"05 - Pure Cardio", todayWeight: "83.5"),
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-24")!, exerciseEmojiIcon:"🏊‍♀️", exerciseType:"Swim", exerciseName:"swimming 3 km", todayWeight: "83.4"),
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-25")!, exerciseEmojiIcon:"⛹", exerciseType:"Basketball", exerciseName:"2 hour basketball", todayWeight: "83.6"),
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-26")!, exerciseEmojiIcon:"🧘‍♂️", exerciseType:"Relax", exerciseName:"rest day", todayWeight: "83.2"),
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-27")!, exerciseEmojiIcon:"🏋️", exerciseType:"Gym", exerciseName:"strength training 1 hour", todayWeight: "83.3"),
            .init(id: UUID().uuidString, date: dateFormatter.date(from: "2020-06-28")!, exerciseEmojiIcon:"🚴‍♀️", exerciseType:"Bicycle", exerciseName:"30min biking", todayWeight: "83.1")
        ]
    }
}
