//
//  ExerciseDetail.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ExerciseDetail: View {
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var record: ExerciseRecord
    
    var body: some View {
        Form {
            Section(header: Text("Exercise").font(.subheadline)) {
                HStack {
                    Text("Icon")
                    Spacer()
                    Text(record.exerciseEmojiIcon)
                }
                HStack {
                    Text("Type")
                    Spacer()
                    TextField(record.exerciseType, text: $record.exerciseType)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack{
                    Text("Name")
                    Spacer()
                    TextField(record.exerciseName, text: $record.exerciseName)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Today's Weight").font(.subheadline))  {
                HStack {
                    Stepper(value: $record.todayWeight, step: 0.1) {
                        Text("\(record.todayWeight, specifier: "%.1f")")
                    }
                }
            }
            
            Section {
                Button("Save") {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("Exercise Detail"))
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State var testRecord = TestDataGenerator().getTestExerciseRecord()
        
        var body: some View {
            ExerciseDetail(record: $testRecord)
        }
    }
}
