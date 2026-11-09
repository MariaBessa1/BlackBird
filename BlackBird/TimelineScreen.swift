//
//  TimelineScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct TimelineScreen: View {
    
    @State private var selectedDate: Date? = nil
    @State private var viewModel: TimelineViewModel
    
    init() {
            let service = DemoTimeline(
                days: DemoTimelineDays.days
            )

            let startDate =
                TimelineSimulationTime.startDate ?? .now

            _viewModel = State(
                initialValue: TimelineViewModel(
                    service: service,
                    startDate: startDate
                )
            )
        }

    
    var body: some View {

        ZStack {

            Color.background
                .ignoresSafeArea()

            TimelineView(
                .periodic(from: .now, by: 1)
            ) { context in

                let selectedDateBinding = Binding<Date>(
                    get: {
                        selectedDate
                        ?? viewModel.simulatedDate(at: context.date)
                    },
                    set: { newDate in
                        selectedDate =
                            Calendar.current.startOfDay(for: newDate)
                    }
                )

                let state = viewModel.state(for: selectedDate, at: context.date
                )

                VStack(alignment: .leading, spacing: 35) {

                    SelectorDates(
                        selectedDate: selectedDateBinding
                    )

                    DaysCarousel(
                        selectedDate: selectedDateBinding
                    )

                    ScrollView(
                        .vertical,
                        showsIndicators: false
                    ) {

                        ClassTimeline(
                            classes: state.classes,
                            completedCount: state.completedCount
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    TimelineScreen()
}
