//
//  IndicatorPoint.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 13/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct IndicatorPoint: View, Identifiable{
    let id: Int
    let position: CGPoint
    var body: some View {
        ZStack{
            Circle()
                .fill(Colors.IndicatorKnob)
            Circle()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
        }
        .frame(width: 10, height: 10)
        .shadow(color: Colors.LegendColor, radius: 6, x: 0, y: 6)
        .position(position)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint(id: 0, position: CGPoint(x: 180, y: 360))
    }
}
