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
    
    /*
     * Initialize new container with records
     */
    @Published internal var records : [ExerciseRecord] = [
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"🏃‍♂️", exerciseType:"Insanity", exerciseName:"05 - Pure Cardio", todayWeight: 83.5),
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"🏊‍♀️", exerciseType:"Swim", exerciseName:"swimming 3 km", todayWeight: 83.4),
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"⛹", exerciseType:"Basketball", exerciseName:"2 hour basketball", todayWeight: 83.6),
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"🧘‍♂️", exerciseType:"Relax", exerciseName:"rest day", todayWeight: 83.2),
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"🏋️", exerciseType:"Gym", exerciseName:"strength training 1 hour", todayWeight: 83.3),
        .init(id: .init(), date: .init(), exerciseEmojiIcon:"🚴‍♀️", exerciseType:"Bicycle", exerciseName:"30min biking", todayWeight: 83.1)
    ]
    
    /*
     * Add new record to container
     */
    func addNewRecord(exerciseRecord: ExerciseRecord) {
        records.append(exerciseRecord)
    }
    
    /*
     * Remove record in container by index
     */
    func removeRecord(index: Int) {
        records.remove(at: index)
    }
    
    /*
     * Remove record in container by index
     */
    func removeRecord(id: UUID) {
        var targetIndex = -1
        for (index, element) in records.enumerated() {
            if element.id == id {
                targetIndex = index
            }
        }
        if targetIndex >= 0 {
            removeRecord(index: targetIndex)
        } else {
            print("record id \(id) is not found!")
        }
    }
}
