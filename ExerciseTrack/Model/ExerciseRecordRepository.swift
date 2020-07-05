//
//  ExerciseDataProtocol.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 25/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

protocol ExerciseRecordRepository {

    func addExerciseRecord(newExerciseRecord: ExerciseRecord)

    func addAllExerciseRecord(newExerciseRecordList: [ExerciseRecord])
    
    func updateExerciseRecord(exerciseRecord: ExerciseRecord)

    func removeExerciseRecordById(recordId: String)

    func getExerciseRecords() -> [ExerciseRecord]
}
