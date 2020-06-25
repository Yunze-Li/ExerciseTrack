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
            Text(TimeUtil.convertTimestampToString(date: exerciseRecord.date, format: "MMM dd"))
                .font(.headline)
            Spacer().frame(width: 15)
            Text(exerciseRecord.exerciseEmojiIcon)
                .font(.title)
            VStack(alignment: .leading) {
                Text(exerciseRecord.exerciseType).font(.body)
                Text(exerciseRecord.exerciseName).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
            Text(exerciseRecord.todayWeight).font(.callout)
        }
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exerciseRecord:PreviewUtil().getPreviewExerciseRecord())
    }
}
