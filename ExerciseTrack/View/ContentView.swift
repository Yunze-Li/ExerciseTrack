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
                NavigationLink(
                destination: ExerciseDetail(exerciseRecord: record)) {
                    ExerciseCell(exerciseRecord:record)
                }
            }.navigationBarItems(
                trailing: NavigationLink(destination: NewExerciseView(exerciseRecordContainer)) {
                    Text("Add")
                }
            ).navigationBarTitle("Exercise")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
