//
//  NewExerciseView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct NewExerciseView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var container: ExerciseRecordContainer = .shared
    
    @State internal var newExerciseRecordIcon : String = ""
    @State internal var newExerciseRecordType : String = ""
    @State internal var newExerciseRecordName : String = ""
    @State internal var newExerciseRecordTodayWeight : String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Create New Exercise").font(.subheadline)) {
                HStack(alignment: .center) {
                    Text("Icon")
                    Spacer()
                    TextField("exercise icon", text: $newExerciseRecordIcon)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack(alignment: .center) {
                    Text("Type")
                    Spacer()
                    TextField("exercise type", text: $newExerciseRecordType)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack(alignment: .center){
                    Text("Name")
                    Spacer()
                    TextField("exercise name", text: $newExerciseRecordName)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Today's Weight").font(.subheadline))  {
                HStack {
                    TextField("weight", text: $newExerciseRecordTodayWeight)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                        .keyboardType(.numbersAndPunctuation)
                }
            }
            
            Section {
                Button("Save") {
                    self.addNewExercise()
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("Exercise Detail"))
    }
    
    func addNewExercise() {
        let todayWeight = Double(newExerciseRecordTodayWeight) ?? 0
        print("add new exercise record! icon: \(newExerciseRecordIcon), type: \(newExerciseRecordType), name: \(newExerciseRecordName), wight: \(newExerciseRecordTodayWeight)")
        self.container.addNewRecord(exerciseRecord: ExerciseRecord(
            id: .init(),
            date: .init(),
            exerciseEmojiIcon: newExerciseRecordIcon,
            exerciseType: newExerciseRecordType,
            exerciseName: newExerciseRecordName,
            todayWeight: todayWeight
        ))
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView()
    }
}
