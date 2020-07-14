//
//  Path.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 13/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

extension Path {
    static func linePathWithData(data:[Double], step:CGPoint, paddingBottom: CGFloat) -> Path {
        var path = Path()
        if (data.count < 2){
            return path
        }
        let points = convertDataToPoints(data: data, step: step, paddingBottom: paddingBottom)
        path.move(to: points[0])
        for index in 1..<points.count {
            path.addLine(to: points[index])
        }
        return path
    }
    
    static func closedLinePathWithData(data:[Double], step:CGPoint, paddingBottom: CGFloat) -> Path {
        var path = Path()
        if (data.count < 2){
            return path
        }
        let points = convertDataToPoints(data: data, step: step, paddingBottom: paddingBottom)
        path.move(to: points[0])
        for index in 1..<points.count {
            path.addLine(to: points[index])
        }
        path.addLine(to: CGPoint(x: points[0].x, y: 0))
        path.closeSubpath()
        return path
    }
    
    static func indicatorPointsWithData(data:[Double], step:CGPoint, paddingBottom: CGFloat) -> [IndicatorPoint] {
        var indicatorPoints: [IndicatorPoint] = []
        let points = convertDataToPoints(data: data, step: step, paddingBottom: paddingBottom)
        for pointIndex in 0..<points.count {
            indicatorPoints.append(IndicatorPoint(id: pointIndex, position: points[pointIndex]) )
        }
        return indicatorPoints
    }
    
    private static func convertDataToPoints(data:[Double], step:CGPoint, paddingBottom: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        guard let offset = data.min() else { return points }
        points.append(CGPoint(x: 0, y: CGFloat(data[0] - offset) * step.y + paddingBottom))
        for pointIndex in 1..<data.count {
            points.append(CGPoint(x: step.x * CGFloat(pointIndex), y: CGFloat(data[pointIndex] - offset) * step.y + paddingBottom))
        }
        return points
    }
    
    
    //    func trimmedPath(for percent: CGFloat) -> Path {
    //        // percent difference between points
    //        let boundsDistance: CGFloat = 0.001
    //        let completion: CGFloat = 1 - boundsDistance
    //
    //        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
    //
    //        let start = pct > completion ? completion : pct - boundsDistance
    //        let end = pct > completion ? 1 : pct + boundsDistance
    //        return trimmedPath(from: start, to: end)
    //    }
    //
    //    func point(for percent: CGFloat) -> CGPoint {
    //        let path = trimmedPath(for: percent)
    //        return CGPoint(x: path.boundingRect.midX, y: path.boundingRect.midY)
    //    }
    //
    //    func point(to maxX: CGFloat) -> CGPoint {
    //        let total = length
    //        let sub = length(to: maxX)
    //        let percent = sub / total
    //        return point(for: percent)
    //    }
    //
    //    var length: CGFloat {
    //        var ret: CGFloat = 0.0
    //        var start: CGPoint?
    //        var point = CGPoint.zero
    //
    //        forEach { ele in
    //            switch ele {
    //            case .move(let to):
    //                if start == nil {
    //                    start = to
    //                }
    //                point = to
    //            case .line(let to):
    //                ret += point.line(to: to)
    //                point = to
    //            case .quadCurve(let to, let control):
    //                ret += point.quadCurve(to: to, control: control)
    //                point = to
    //            case .curve(let to, let control1, let control2):
    //                ret += point.curve(to: to, control1: control1, control2: control2)
    //                point = to
    //            case .closeSubpath:
    //                if let to = start {
    //                    ret += point.line(to: to)
    //                    point = to
    //                }
    //                start = nil
    //            }
    //        }
    //        return ret
    //    }
    //
    //    func length(to maxX: CGFloat) -> CGFloat {
    //        var ret: CGFloat = 0.0
    //        var start: CGPoint?
    //        var point = CGPoint.zero
    //        var finished = false
    //
    //        forEach { ele in
    //            if finished {
    //                return
    //            }
    //            switch ele {
    //            case .move(let to):
    //                if to.x > maxX {
    //                    finished = true
    //                    return
    //                }
    //                if start == nil {
    //                    start = to
    //                }
    //                point = to
    //            case .line(let to):
    //                if to.x > maxX {
    //                    finished = true
    //                    ret += point.line(to: to, x: maxX)
    //                    return
    //                }
    //                ret += point.line(to: to)
    //                point = to
    //            case .quadCurve(let to, let control):
    //                if to.x > maxX {
    //                    finished = true
    //                    ret += point.quadCurve(to: to, control: control, x: maxX)
    //                    return
    //                }
    //                ret += point.quadCurve(to: to, control: control)
    //                point = to
    //            case .curve(let to, let control1, let control2):
    //                if to.x > maxX {
    //                    finished = true
    //                    ret += point.curve(to: to, control1: control1, control2: control2, x: maxX)
    //                    return
    //                }
    //                ret += point.curve(to: to, control1: control1, control2: control2)
    //                point = to
    //            case .closeSubpath:
    //                fatalError("Can't include closeSubpath")
    //            }
    //        }
    //        return ret
    //    }
    //
    //    static func quadCurvedPathWithPoints(points:[Double], step:CGPoint, globalOffset: Double? = nil) -> Path {
    //        var path = Path()
    //        if (points.count < 2){
    //            return path
    //        }
    //        let offset = globalOffset ?? points.min()!
    ////        guard let offset = points.min() else { return path }
    //        var p1 = CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y)
    //        path.move(to: p1)
    //        for pointIndex in 1..<points.count {
    //            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y*CGFloat(points[pointIndex]-offset))
    //            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
    //            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
    //            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
    //            p1 = p2
    //        }
    //        return path
    //    }
    //
    //    static func quadClosedCurvedPathWithPoints(points:[Double], step:CGPoint, globalOffset: Double? = nil) -> Path {
    //        var path = Path()
    //        if (points.count < 2){
    //            return path
    //        }
    //        let offset = globalOffset ?? points.min()!
    //
    ////        guard let offset = points.min() else { return path }
    //        path.move(to: .zero)
    //        var p1 = CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y)
    //        path.addLine(to: p1)
    //        for pointIndex in 1..<points.count {
    //            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y*CGFloat(points[pointIndex]-offset))
    //            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
    //            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
    //            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
    //            p1 = p2
    //        }
    //        path.addLine(to: CGPoint(x: p1.x, y: 0))
    //        path.closeSubpath()
    //        return path
    //    }
}
