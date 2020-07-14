//
//  Line.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 13/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

public struct Line: View {
    @ObservedObject var data: ChartData
    @Binding var frame: CGRect
    @State private var showFull: Bool = false
    @State var showBackground: Bool = true
    var paddingTop:CGFloat = 30
    var paddingBottom:CGFloat = 30
    var gradient: GradientColor = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    var index:Int = 0
    let padding:CGFloat = 30
    var curvedLines: Bool = true
    var stepWidth: CGFloat {
        if data.points.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.points.count-1)
    }
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data.onlyPoints()
        if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        if let min = min, let max = max, min != max {
            return (frame.size.height-paddingTop-paddingBottom) / CGFloat(max - min)
        }
        return 0
    }
    var path: Path {
        let data = self.data.onlyPoints()
        return Path.linePathWithData(data: data, step: CGPoint(x: stepWidth, y: stepHeight), paddingBottom: paddingBottom)
    }
    var closedPath: Path {
        let data = self.data.onlyPoints()
        return Path.closedLinePathWithData(data: data, step: CGPoint(x: stepWidth, y: stepHeight), paddingBottom: paddingBottom)
    }
    var indicatorPoints: [IndicatorPoint] {
        let data = self.data.onlyPoints()
        let temp = Path.indicatorPointsWithData(data: data, step: CGPoint(x: stepWidth, y: stepHeight), paddingBottom: paddingBottom)
        return temp
    }
    
    public var body: some View {
        ZStack {
            if(self.showFull && self.showBackground){
                self.closedPath
                    .fill(LinearGradient(gradient: Gradient(colors: [Colors.GradientUpperBlue, .white]), startPoint: .bottom, endPoint: .top))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .transition(.opacity)
                    .animation(.easeIn(duration: 1.6))
            }
            self.path
                .trim(from: 0, to: self.showFull ? 1:0)
                .stroke(LinearGradient(gradient: gradient.getGradient(), startPoint: .leading, endPoint: .trailing) ,style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .animation(Animation.easeOut(duration: 1.2).delay(Double(self.index)*0.4))
                .onAppear {
                    self.showFull = true
            }
            .onDisappear {
                self.showFull = false
            }
            .drawingGroup()
            ForEach(self.indicatorPoints) { point in
                point.rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader{ geometry in
                Line(data: ChartData(points: [84.0,83.8,83.6,84.0,83.8,83.6]), frame: .constant(geometry.frame(in: .local)))
            }.frame(width: 320, height: 160)
        }
    }
}
