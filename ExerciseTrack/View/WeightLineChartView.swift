//
//  WeightLineChartView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 13/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct WeightLineChartView: View {
    var body: some View {
        LineView(data: [84.0,83.8,83.6,84.0,83.8,83.6]).padding()
        .frame(minHeight: 160, idealHeight: 160, maxHeight: 160, alignment: .center)
    }
}

struct WeightLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeightLineChartView()
    }
}
