//
//  WeightLineChartView.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 13/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct WeightLineChartView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    private var data: [Double]
    private var darkModeStyle: ChartStyle
    private var style: ChartStyle
    init(data: [Double],
         style: ChartStyle = Styles.lineChartStyleOne) {
        self.data = data
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
        self.style = style
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .fill(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                .frame(height: 200, alignment: .center)
                .shadow(color: self.style.dropShadowColor, radius: 8)
            LineView(data: self.data, paddingTop: 40.0, paddingBottom: 40.0).padding()
        }.frame(height: 200, alignment: .center)
    }
}

struct WeightLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeightLineChartView(data: [84.0,83.7,83.6,84.1,83.8,83.6])
    }
}
