//
//  WeightRecord.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

final class ExerciseRecordContainer: ObservableObject {
    
    static let shared = ExerciseRecordContainer(realmManager: RealmManager())
    private var realmManager: RealmManager
    
    /*
     * Initialize new container with records
     */
    @Published internal var records : [ExerciseRecord] = []
    
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
        records = realmManager.getExerciseRecordFromRealm()
    }
    
    /*
     * Add new record to container
     */
    func addNewRecord(exerciseRecord: ExerciseRecord) {
        records.append(exerciseRecord)
        let exerciseMapper = ExerciseMapper()
        let model = exerciseMapper.mapExerciseRecordToModel(record: exerciseRecord)
        realmManager.addExerciseModelToRealm(model: model)
    }
    
    /*
     * Add all records to container
     */
    func addAllRecords(exerciseRecordList: [ExerciseRecord]) {
        records.append(contentsOf: exerciseRecordList)
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
            print("record id \(id) is not found!")
        }
    }
}
