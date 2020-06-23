//
//  NewExerciseView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 22/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct NewExerciseView: View {
    
    @ObservedObject var container: ExerciseRecordContainer = .shared
    
    @State internal var newExerciseRecordIcon : String = ""
    @State internal var newExerciseRecordType : String = ""
    @State internal var newExerciseRecordName : String = ""
    @State internal var newExerciseRecordTodayWeight : String = ""
    
    var body: some View {
        NavigationView {
            List {
                HStack(alignment: .center) {
                    Text("Icon")
                    Spacer()
                    TextField("Exercise Icon", text: $newExerciseRecordIcon)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack(alignment: .center) {
                    Text("Type")
                    Spacer()
                    TextField("Exercise Type", text: $newExerciseRecordType)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack(alignment: .center){
                    Text("Name")
                    Spacer()
                    TextField("Exercise Name", text: $newExerciseRecordName)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
                HStack(alignment: .center) {
                    Text("Today's Weight")
                    Spacer()
                    TextField("Weight", text: $newExerciseRecordTodayWeight)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                }
            }
            .navigationBarTitle(Text("Exercise Detail"))
            .navigationBarItems(trailing: Button(action: addNewExercise) {
                Text("Done")
            })
        }
    }
    
    func addNewExercise() {
        let todayWeight = Double(newExerciseRecordTodayWeight) ?? 0
        print("add new exercise record! icon: \(newExerciseRecordIcon), type: \(newExerciseRecordType), name: \(newExerciseRecordName), wight: \(newExerciseRecordTodayWeight)")
        self.container.records.append(
            ExerciseRecord(
                id: .init(),
                exerciseEmojiIcon: newExerciseRecordIcon,
                exerciseType: newExerciseRecordType,
                exerciseName: newExerciseRecordName,
                todayWeight: todayWeight
            )
        )
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView()
    }
}
