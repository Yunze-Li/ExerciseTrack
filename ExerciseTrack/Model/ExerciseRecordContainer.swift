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
    private var exerciseDateRepository: ExerciseRecordRepository
    @Published internal var records: [ExerciseRecord] = []

    init(exerciseDateRepository: ExerciseRecordRepository) {
        self.exerciseDateRepository = exerciseDateRepository
        self.records = self.exerciseDateRepository.getExerciseRecords()
        sortRecordsByDateDescending()
    }

    /*
     * Add new record to container
     */
    func addNewRecord(exerciseRecord: ExerciseRecord) {
        records.append(exerciseRecord)
        sortRecordsByDateDescending()
        exerciseDateRepository.addExerciseRecord(newExerciseRecord: exerciseRecord)
    }

    /*
     * Add all records to container
     */
    func addAllRecords(exerciseRecordList: [ExerciseRecord]) {
        records.append(contentsOf: exerciseRecordList)
        sortRecordsByDateDescending()
        exerciseDateRepository.addAllExerciseRecord(newExerciseRecordList: exerciseRecordList)
    }

    /*
     * Remove record in container by indexSet
     */
    func removeRecord(offsets: IndexSet) {
        for index in offsets {
            exerciseDateRepository.removeExerciseRecordById(recordId: records[index].id)
        }
        records.remove(atOffsets: offsets)
    }

    /*
     * Remove record in container by index
     */
    func removeRecord(index: Int) {
        records.remove(at: index)
        exerciseDateRepository.removeExerciseRecordById(recordId: records[index].id)
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
    
    private func sortRecordsByDateDescending() {
        records.sort {
            $0.date > $1.date
        }
    }
}
