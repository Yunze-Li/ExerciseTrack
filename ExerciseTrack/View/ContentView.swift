//
//  ContentView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var exerciseRecordContainer = ExerciseRecordContainer()
    
    var body: some View {
        NavigationView {
            List(exerciseRecordContainer.records) { record in
                HStack {
                    Text(record.exerciseEmojiIcon)
                    VStack(alignment: .leading) {
                        Text(record.exerciseType).font(.headline)
                        Text(record.exerciseName).font(.subheadline).foregroundColor(.secondary)
                    }
                    Spacer()
                    Text(String(format:"%.1f", record.todayWeight)).font(.title)
                }
                .navigationBarTitle("Exercise")
                .navigationBarItems(
                    trailing: Button(
                        action: self.addNewExercise,
                        label: {Text("Add")}
                ))
            }
        }
    }
    
    func addNewExercise() {
        print("new item is added!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
