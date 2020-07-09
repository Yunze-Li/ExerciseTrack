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
    var container: ExerciseRecordContainer

    let exerciseEmojiIcons: [String] = ExerciseIconProvider.provideAvailableExerciseEmojiIcon()

    var body: some View {
        Form {
            Section(header: Text("Exercise Date").font(.subheadline)) {
                DatePicker("Date", selection: $record.date, displayedComponents: .date)
            }
            
            Section(header: Text("Exercise Detail").font(.subheadline)) {
                HStack {
                    Picker("Icon", selection: $record.exerciseEmojiIcon) {
                        ForEach(0 ..< exerciseEmojiIcons.count) { index in
                            Text(self.exerciseEmojiIcons[index]).tag(self.exerciseEmojiIcons[index])
                        }
                    }
                }
                HStack {
                    Text("Type")
                    Spacer(minLength: 100)
                    ChineseSupportedTextField(record.exerciseType, text: $record.exerciseType)
                }
                HStack {
                    Text("Name")
                    Spacer(minLength: 100)
                    ChineseSupportedTextField(record.exerciseName, text: $record.exerciseName)
                }
            }

            Section(header: Text("Today's Weight").font(.subheadline)) {
                HStack {
                    Text("Weight")
                    Spacer()
                    TextField(record.todayWeight, text: $record.todayWeight)
                        .multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                }
            }

            Section {
                Button("Save") {
                    self.UpdateExistedExercise()
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("Exercise Detail"), displayMode: .inline)
    }
    
    func UpdateExistedExercise() {
        print("update exercise record! icon: \(record.exerciseEmojiIcon), type: \(record.exerciseType), name: \(record.exerciseName), wight: \(record.todayWeight)")
        self.container.updateRecord(exerciseRecord: record)
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var previewRecord = TestDataUtil().getPreviewExerciseRecord()
        let testContainer = ExerciseRecordContainer(exerciseDateRepository: PreviewExerciseDataRepository())

        var body: some View {
            NavigationView {
                ExerciseDetail(record: $previewRecord, container: testContainer)
            }
        }
    }
}
