//
//  WeightRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

final class ExerciseRecordContainer: ObservableObject {
    
    static let shared = ExerciseRecordContainer()
    
    @Published var records : [ExerciseRecord] = [
        .init(id: .init(), exerciseEmojiIcon:"🏃‍♂️", exerciseType:"Insanity", exerciseName:"05 - Pure Cardio", todayWeight: 83.5),
        .init(id: .init(), exerciseEmojiIcon:"🏊‍♀️", exerciseType:"Swim", exerciseName:"swimming 3 km", todayWeight: 83.4),
        .init(id: .init(), exerciseEmojiIcon:"⛹", exerciseType:"Basketball", exerciseName:"2 hour basketball", todayWeight: 83.6),
        .init(id: .init(), exerciseEmojiIcon:"🧘‍♂️", exerciseType:"Relax", exerciseName:"rest day", todayWeight: 83.2),
        .init(id: .init(), exerciseEmojiIcon:"🏋️", exerciseType:"Gym", exerciseName:"strength training 1 hour", todayWeight: 83.3),
        .init(id: .init(), exerciseEmojiIcon:"🚴‍♀️", exerciseType:"Bicycle", exerciseName:"30min biking", todayWeight: 83.1)
    ]
}
