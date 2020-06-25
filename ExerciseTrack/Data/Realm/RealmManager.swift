//
//  RealmManager.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/25.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: ExerciseDataRepository {
    
    lazy var realm = { try! Realm() }()
    lazy var mapper: ExerciseMapper = { ExerciseMapper() }()
    
    func addExerciseRecord(newExerciseRecord: ExerciseRecord) {
        let model = mapper.mapExerciseRecordToModel(newExerciseRecord)
        addExerciseModelToRealm(model)
    }
    
    func addAllExerciseRecord(newExerciseRecordList: [ExerciseRecord]) {
        var modelList: [ExerciseModel] = []
        for record in newExerciseRecordList {
            modelList.append(mapper.mapExerciseRecordToModel(record))
        }
        for model in modelList {
            addExerciseModelToRealm(model)
        }
    }
    
    func removeExerciseRecordByItem(targetExerciseRecord: ExerciseRecord) {
        let model = mapper.mapExerciseRecordToModel(targetExerciseRecord)
        removeExerciseModel(model)
    }
    
    func removeExerciseRecordById(id: String) {
        let results = realm.objects(ExerciseModel.self).filter("id == \(id)").first
        if results != nil {
            removeExerciseModel(results!)
        } else {
            NSLog("id: \(id) is not found, remove failed!")
        }
    }
    
    func getExerciseRecords() -> [ExerciseRecord] {
        let exerciseModels: [ExerciseModel] = getExerciseModelsFromRealm()
        var exerciseRecords: [ExerciseRecord] = []
        for exerciseModel in exerciseModels {
            exerciseRecords.append(mapper.mapExerciseModelToRecord(exerciseModel))
        }
        return exerciseRecords
    }
    
    private func addExerciseModelToRealm(_ model: ExerciseModel) {
        NSLog("exercise model id: \(model.id), name: \(model.exerciseName) is trying to add to realm DB")
        try! realm.write {
            realm.add(model)
        }
    }
    
    private func removeExerciseModel(_ model: ExerciseModel) {
        NSLog("exercise model id: \(model.id), name: \(model.exerciseName) is trying to remove from realm DB")
        try! realm.write {
            realm.delete(model)
        }
    }
    
    private func getExerciseModelsFromRealm() -> [ExerciseModel] {
        var exerciseModels: [ExerciseModel] = []
        let realmResults = realm.objects(ExerciseModel.self)
        NSLog("fetch \(realmResults.count) exercise models from realm DB")
        for exerciseModel in realmResults {
            exerciseModels.append(exerciseModel)
        }
        return exerciseModels
    }
}
