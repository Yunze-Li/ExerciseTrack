//
//  RealmManager.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/25.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: ExerciseRecordRepository {
    
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
    
    func updateExerciseRecord(exerciseRecord: ExerciseRecord) {
        let model = mapper.mapExerciseRecordToModel(exerciseRecord)
        updateExerciseModelToRealm(model)
    }
    
    func removeExerciseRecordById(recordId: String) {
        removeExerciseModelById(recordId: recordId)
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
        try! realm.write {
            realm.add(model)
        }
        NSLog("exercise model type: \(model.exerciseType), name: \(model.exerciseName) is added to realm DB")
    }
    
    private func updateExerciseModelToRealm(_ model: ExerciseModel) {
        let exerciseModel = realm.objects(ExerciseModel.self).filter("id == %@", model.id).first
        try! realm.write {
            exerciseModel!.date = model.date
            exerciseModel!.exerciseEmojiIcon = model.exerciseEmojiIcon
            exerciseModel!.exerciseType = model.exerciseType
            exerciseModel!.exerciseName = model.exerciseName
            exerciseModel!.todayWeight = model.todayWeight
        }
        NSLog("exercise model id: \(model.id) is updated to realm DB")
    }
    
    private func removeExerciseModelById(recordId: String) {
        try! realm.write {
            realm.delete(realm.objects(ExerciseModel.self).filter("id == %@", recordId))
            NSLog("exercise id: \(recordId) is removed from realm DB")
        }
    }
    
    private func getExerciseModelsFromRealm() -> [ExerciseModel] {
        var exerciseModels: [ExerciseModel] = []
        let realmResults = realm.objects(ExerciseModel.self).sorted(byKeyPath: "date", ascending: false)
        NSLog("fetch \(realmResults.count) exercise models from realm DB")
        for exerciseModel in realmResults {
            exerciseModels.append(exerciseModel)
        }
        return exerciseModels
    }
}
