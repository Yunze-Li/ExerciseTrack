//
//  ContentView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/22.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var container: ExerciseRecordContainer = .shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(container.records.indexed(), id: \.1.id) { index, record in
                    NavigationLink(destination: ExerciseDetail(record: self.$container.records[index])) {
                        ExerciseCell(exerciseRecord:record)
                    }
                }.onDelete(perform: deleteRecord(at:))
            }.navigationBarItems(
                trailing: NavigationLink(destination: NewExerciseView()) {
                    Text("Add")
                }
            ).navigationBarTitle("Exercise Tracker")
        }
    }
    
    func deleteRecord(at offsets: IndexSet) {
        container.records.remove(atOffsets: offsets)
    }
}

//// Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let testContainer = ExerciseRecordContainer()
//        testContainer.addAllRecords(exerciseRecordList: TestUtil().getTestExerciseRecordList())
//        return ContentView(container: testContainer)
//    }
//}
