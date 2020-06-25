//
//  RealmManager.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/25.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    lazy var realm = {
        try! Realm()
    }()
    
    func addExerciseModelToRealm(model: ExerciseModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func getExerciseRecordFromRealm() -> [ExerciseRecord] {
        var recordList: [ExerciseRecord] = []
        let realmResults = realm.objects(ExerciseModel.self)
        let exerciseMapper = ExerciseMapper()
        for exerciseModel in realmResults {
            recordList.append(exerciseMapper.mapExerciseModelToRecord(model: exerciseModel))
        }
        return recordList
    }
}
