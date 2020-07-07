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
        return ExerciseRecord(id: UUID().uuidString, date: getRandomDate(), exerciseEmojiIcon: getRandomEmojiIcon(), exerciseType: getRandomExerciseType(), exerciseName: getRandomExerciseName(), todayWeight: getRandomWeight())
    }
    
    func getPreviewExerciseRecords(count: Int) -> [ExerciseRecord] {
        var testRecords: [ExerciseRecord] = []
        for _ in 0...count {
            testRecords.append(.init(id: UUID().uuidString, date: getRandomDate(), exerciseEmojiIcon: getRandomEmojiIcon(), exerciseType: getRandomExerciseType(), exerciseName: getRandomExerciseName(), todayWeight: getRandomWeight()))
        }
        return testRecords
    }
    
    private func getRandomDate() -> Date {
        let startDate = dateFormatter.date(from: "2020-06-23")!
        let randomDate = Calendar.current.date(byAdding: .day, value: Int.random(in: 0 ..< 15), to: startDate)!
        return randomDate
    }
    
    private func getRandomEmojiIcon() -> String {
        let icons = ExerciseIconProvider.provideAvailableExerciseEmojiIcon()
        return icons[Int.random(in: 0 ..< icons.count)]
    }
    
    private func getRandomExerciseType() -> String {
        let testExerciseTypes = ["Insanity", "Swim", "Basketball", "Relax", "Gym", "Bicycle", "Dance", "Bouldering", "Running"]
        return testExerciseTypes[Int.random(in: 0 ..< testExerciseTypes.count)]
    }
    
    private func getRandomExerciseName() -> String {
        let testExerciseNames = ["1 hour", "30 min", "2 hours", "haven't count the time", "15min"]
        return testExerciseNames[Int.random(in: 0 ..< testExerciseNames.count)]
    }
    
    private func getRandomWeight() -> String {
        let randomWeight = 83 + Float.random(in: 0 ..< 1)
        return String(format: "%.1f", randomWeight)
    }
}
