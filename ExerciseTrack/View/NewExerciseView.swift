//
//  NewExerciseView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

// TODO: merge this with Exercise Detail view
struct NewExerciseView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var container: ExerciseRecordContainer = .shared
    
    @State internal var newExerciseRecordIcon : String = ""
    @State internal var newExerciseRecordType : String = ""
    @State internal var newExerciseRecordName : String = ""
    @State internal var newExerciseRecordTodayWeight : String = ""
    
    let exerciseEmojiIcons: [String] = ExerciseIconProvider.provideAvailableExerciseEmojiIcon()
    
    var body: some View {
        Form {
            Section(header: Text("Create New Exercise").font(.subheadline)) {
                HStack {
                    Picker("Icon", selection: $newExerciseRecordIcon) {
                        ForEach(0 ..< exerciseEmojiIcons.count) { index in
                            Text(self.exerciseEmojiIcons[index]).tag(self.exerciseEmojiIcons[index])
                        }
                    }
                }
                HStack {
                    Text("Type")
                    Spacer()
                    TextField("enter exercise type", text: $newExerciseRecordType)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("enter exercise name", text: $newExerciseRecordName)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Today's Weight").font(.subheadline))  {
                HStack {
                    TextField("enter your weight", text: $newExerciseRecordTodayWeight)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
            }
            
            Section {
                Button("Save") {
                    self.addNewExercise()
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("Exercise Detail"), displayMode: .inline)
    }
    
    func addNewExercise() {
        print("add new exercise record! icon: \(newExerciseRecordIcon), type: \(newExerciseRecordType), name: \(newExerciseRecordName), wight: \(newExerciseRecordTodayWeight)")
        self.container.addNewRecord(exerciseRecord: ExerciseRecord(
            id: .init(),
            date: .init(),
            exerciseEmojiIcon: newExerciseRecordIcon,
            exerciseType: newExerciseRecordType,
            exerciseName: newExerciseRecordName,
            todayWeight: newExerciseRecordTodayWeight
        ))
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewExerciseView()
        }
    }
}
