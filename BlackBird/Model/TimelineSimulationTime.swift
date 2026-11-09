//
//  TimelineSimulationTime.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 09/11/26.
//

import SwiftUI
import Foundation

enum TimelineSimulationTime {

    static let groupID = "group.Maria.BlackBird"

    private static let startKey = "simulationStartDate"

    private static var defaults: UserDefaults? {
        UserDefaults(suiteName: groupID)
    }

    static var startDate: Date? {
        defaults?.object(forKey: startKey) as? Date
    }

    static func reset() {
        defaults?.set(Date(), forKey: startKey
        )
    }
}
