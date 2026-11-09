//
//  DemoTimeline.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 08/11/26.
//

import SwiftUI
import Foundation

struct DemoTimeline {

    let days: [[ClassSession]]

    let interval: TimeInterval = 30

    func dayOffset(
        at date: Date,
        startedAt startDate: Date
    ) -> Int {

        let elapsed = max(
            0,
            date.timeIntervalSince(startDate)
        )

        let steps = Int(elapsed / interval)

        return steps / 4
    }

    func state(
        at date: Date,
        startedAt startDate: Date
    ) -> TimelineState {

        let elapsed = max(
            0,
            date.timeIntervalSince(startDate)
        )

        let steps = Int(elapsed / interval)

        let dayIndex = (steps / 4) % days.count
        let completedCount = steps % 4

        return TimelineState(
            dayIndex: dayIndex,
            completedCount: completedCount,
            classes: days[dayIndex]
        )
    }

    func stateForDay(
        _ dayOffset: Int
    ) -> TimelineState {

        let index = ((dayOffset % days.count) + days.count) % days.count

        return TimelineState(
            dayIndex: index,
            completedCount: 0,
            classes: days[index]
        )
    }
}
