//
//  Line.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 2020/6/28.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct Line: View {
    var body: some View {
        LineView(data: [80, 70, 64, 60, 58, 52, 44, 38, 28, 10])
        
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
