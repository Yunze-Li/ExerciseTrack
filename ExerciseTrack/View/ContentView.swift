//
//  ContentView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var exerciseRecordContainer : ExerciseRecordContainer
    
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView {
            List(exerciseRecordContainer.records) { record in
                NavigationLink(
                destination: ExerciseDetail(exerciseRecord: record)) {
                    ExerciseCell(exerciseRecord:record)
                }.isDetailLink(false)
            }.navigationBarItems(
                trailing: NavigationLink(destination: NewExerciseView(rootIsActive: self.$isActive), isActive: self.$isActive) {
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
