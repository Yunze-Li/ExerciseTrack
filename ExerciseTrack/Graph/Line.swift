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
    @State var tabIndex:Int = 0
    let charData = ChartData(points: [54.0,53.8,53.6,54.0,53.8,53.6])
    var body: some View {
        TabView(selection: $tabIndex) {
            BarCharts().tabItem { Group{
                Image(systemName: "chart.bar")
                Text("Bar charts")
                }}.tag(0)
            LineCharts().tabItem { Group{
                Image(systemName: "waveform.path.ecg")
                Text("Line charts")
                }}.tag(1)
            PieCharts().tabItem { Group{
                Image(systemName: "chart.pie")
                Text("Pie charts")
                }}.tag(2)
            LineChartsFull().tabItem { Group{
                Image(systemName: "waveform.path.ecg")
                Text("Full screen line charts")
                }}.tag(3)
        }
    }
}

struct BarCharts:View {
    let charData = ChartData(points: [8,23,54,32,12,37,7,23,43])
    var body: some View {
        VStack{
            BarChartView(data: charData, title: "Title", style: Styles.barChartStyleOrangeLight)
        }
    }
}

struct LineCharts:View {
    var body: some View {
        VStack{
            LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title")
        }
    }
}

struct PieCharts:View {
    var body: some View {
        VStack{
            PieChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title")
        }
    }
}

struct LineChartsFull: View {
    var body: some View {
        VStack{
            LineView(data: [540,538,536,540,538,536], title: "Line chart", legend: "Full screen").padding()
            // legend is optional, use optional .padding()
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
