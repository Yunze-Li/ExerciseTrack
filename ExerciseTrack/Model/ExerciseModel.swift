//
//  ExerciseModel.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/24.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation
import RealmSwift

class ExerciseModel : Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date = Date()
    @objc dynamic var exerciseEmojiIcon = ""
    @objc dynamic var exerciseType = ""
    @objc dynamic var exerciseName = ""
    @objc dynamic var todayWeight = ""
}
