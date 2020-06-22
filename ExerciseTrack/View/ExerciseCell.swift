//
//  ExerciseCell.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ExerciseCell: View {
    var exerciseRecord :ExerciseRecord
    var body: some View {
        HStack {
            Text(exerciseRecord.exerciseEmojiIcon)
            VStack(alignment: .leading) {
                Text(exerciseRecord.exerciseType).font(.headline)
                Text(exerciseRecord.exerciseName).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format:"%.1f", exerciseRecord.todayWeight)).font(.callout)
        }
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exerciseRecord:TestDataGenerator().getTestExerciseRecord())
    }
}
