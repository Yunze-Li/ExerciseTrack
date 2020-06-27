//
//  Extension.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 24/06/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import Foundation

extension Sequence {
    func indexed() -> [(offset: Int, element: Element)] {
        return Array(enumerated())
    }
}
