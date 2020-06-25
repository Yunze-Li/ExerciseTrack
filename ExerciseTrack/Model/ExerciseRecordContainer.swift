//
//  WeightRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

// This is a container using byu SwiftUI to observe data change between views, it holds
// an implementation of ExerciseDataRepository and update at same time
final class ExerciseRecordContainer: ObservableObject {
    
    /*
     * Initialize with records data and exerciseDateRepository
     */
    private var exerciseDateRepository: ExerciseDataRepository
    @Published internal var records : [ExerciseRecord] = []
    
    init(exerciseDateRepository: ExerciseDataRepository) {
        self.exerciseDateRepository = exerciseDateRepository
        self.records = self.exerciseDateRepository.getExerciseRecords()
    }
    
    /*
     * Add new record to container
     */
    func addNewRecord(exerciseRecord: ExerciseRecord) {
        records.append(exerciseRecord)
        exerciseDateRepository.addExerciseRecord(newExerciseRecord: exerciseRecord)
    }
    
    /*
     * Add all records to container
     */
    func addAllRecords(exerciseRecordList: [ExerciseRecord]) {
        records.append(contentsOf: exerciseRecordList)
        exerciseDateRepository.addAllExerciseRecord(newExerciseRecordList: exerciseRecordList)
    }
    
    /*
     * Remove record in container by index
     */
    func removeRecord(index: Int) {
        let target = records[index]
        records.remove(at: index)
        exerciseDateRepository.removeExerciseRecordByItem(targetExerciseRecord: target)
    }
    
    /*
     * Remove record in container by id
     */
    func removeRecord(id: String) {
        var targetIndex = -1
        for (index, element) in records.enumerated() {
            if element.id == id {
                targetIndex = index
            }
        }
        if targetIndex >= 0 {
            removeRecord(index: targetIndex)
        } else {
            NSLog("record id \(id) is not found!")
        }
    }
}
