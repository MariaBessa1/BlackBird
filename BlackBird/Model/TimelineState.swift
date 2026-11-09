//
//  TimelineState.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 08/11/26.
//
struct TimelineState {

    let dayIndex: Int
    let completedCount: Int
    let classes: [ClassSession]

    var progress: Double {
        guard !classes.isEmpty else { return 0 }

        return Double(completedCount) / Double(classes.count)
    }

    var nextClass: ClassSession? {
        guard completedCount < classes.count else {
            return nil
        }

        return classes[completedCount]
    }
}
