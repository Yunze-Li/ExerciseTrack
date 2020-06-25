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
    
    let exerciseEmojiIcons: [String] = ExerciseIconProvider.provideAvailableExerciseEmojiIcon()
    
    var body: some View {
        Form {
            Section(header: Text("Exercise Detail").font(.subheadline)) {
                HStack {
                    Picker("Icon", selection:$record.exerciseEmojiIcon) {
                        ForEach(0 ..< exerciseEmojiIcons.count) { index in
                            Text(self.exerciseEmojiIcons[index]).tag(self.exerciseEmojiIcons[index])
                        }
                    }
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
                    Text("Weight")
                    Spacer()
                    TextField(record.todayWeight, text: $record.todayWeight)
                        .lineLimit(1).multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
            }
            
            Section {
                Button("Save") {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text("Exercise Detail"), displayMode: .inline)
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State var previewRecord = PreviewUtil().getPreviewExerciseRecord()
        
        var body: some View {
            NavigationView {
                ExerciseDetail(record: $previewRecord)
            }
        }
    }
}
