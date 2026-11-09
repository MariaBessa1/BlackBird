//
//  TimelineViewModel.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 08/11/26.
//
import SwiftUI

@Observable
final class TimelineViewModel {

    private let service: DemoTimeline
    private let startDate: Date
    private let calendar = Calendar.current

    private(set) var schedule: TimelineState

    init(
        service: DemoTimeline,
        startDate: Date
    ) {
        self.service = service
        self.startDate = startDate

        self.schedule = service.state(
            at: .now,
            startedAt: startDate
        )
    }
    // Segunda-feira de ref
    
    private var firstDemoDate: Date {

        let start = calendar.startOfDay(for: startDate)

        let weekday = calendar.component(
            .weekday,
            from: start
        )

        let daysUntilMonday = (9 - weekday) % 7

        return calendar.date(
            byAdding: .day,
            value: daysUntilMonday,
            to: start
        )!
    }

    //Data acompanhando o relógio
    
    func simulatedDate(at date: Date) -> Date {

        let offset = service.dayOffset(
            at: date,
            startedAt: startDate
        )

        return calendar.date(
            byAdding: .day,
            value: offset,
            to: firstDemoDate
        )!
    }

    //Cronograma da data selecionada
    func state(
        for selectedDate: Date?,
        at currentDate: Date
    ) -> TimelineState {

        guard let selectedDate else {

            return service.state(
                at: currentDate,
                startedAt: startDate
            )
        }

        let dayOffset = calendar.dateComponents(
            [.day],
            from: firstDemoDate,
            to: calendar.startOfDay(for: selectedDate)
        ).day ?? 0

        return service.stateForDay(dayOffset)
    }

    func update(at date: Date = .now) {
        schedule = service.state(
            at: date,
            startedAt: startDate
        )
    }
}
