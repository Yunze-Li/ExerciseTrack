//
//  ExerciseDetail.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
    var exerciseRecord: ExerciseRecord
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Icon")
                    Spacer()
                    Text(exerciseRecord.exerciseEmojiIcon)
                }
                HStack {
                    Text("Type")
                    Spacer()
                    Text(exerciseRecord.exerciseType)
                }
                HStack{
                    Text("Name")
                    Spacer()
                    Text(exerciseRecord.exerciseName)
                }
                HStack {
                    Text("Today's Weight")
                    Spacer()
                    Text(String(format:"%.1f", exerciseRecord.todayWeight))
                }.navigationBarTitle(Text("Exercise Detail"))
            }
        }
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetail(exerciseRecord: TestDataGenerator().getTestExerciseRecord())
    }
}
