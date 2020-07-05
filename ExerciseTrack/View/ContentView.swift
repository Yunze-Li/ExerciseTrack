//
//  ContentView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @ObservedObject var container: ExerciseRecordContainer
    
    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Spacer(minLength: 20)
                List {
                    ForEach(container.records.indexed(), id: \.1.id) { index, record in
                        NavigationLink(destination: ExerciseDetail(record: self.$container.records[index], container: self.container)) {
                            ExerciseCell(exerciseRecord: record)
                        }
                    }.onDelete(perform: deleteRecord(at:))
                }.navigationBarItems(
                    trailing: NavigationLink(destination: NewExerciseView(container: container)) {
                        Text("Add")
                    }
                ).navigationBarTitle(Text("Exercise Tracker"))
            }
        }
    }
    
    func deleteRecord(at offsets: IndexSet) {
        container.removeRecord(offsets: offsets)
    }
}

// Preview
class PreviewExerciseDataRepository: ExerciseRecordRepository {
    func addExerciseRecord(newExerciseRecord: ExerciseRecord) {}
    func addAllExerciseRecord(newExerciseRecordList: [ExerciseRecord]) {}
    func updateExerciseRecord(exerciseRecord: ExerciseRecord) {}
    func removeExerciseRecordByItem(targetExerciseRecord: ExerciseRecord) {}
    func removeExerciseRecordById(recordId: String) {}
    func getExerciseRecords() -> [ExerciseRecord] { return TestDataUtil().getPreviewExerciseRecords() }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let testContainer = ExerciseRecordContainer(exerciseDateRepository: PreviewExerciseDataRepository())
        return ContentView(container: testContainer)
    }
}
