//
//  BlackBirdWidget.swift
//  BlackBirdWidget
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    private let service = DemoTimeline(days: DemoTimelineDays.days)
    
    func placeholder(in context: Context) -> SimpleEntry {
        let now = Date()
        
        return SimpleEntry(
            date: now,
            timeline: service.state(at: now, startedAt: now)
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let now = Date()
        let startDate = TimelineSimulationTime.startDate ?? now

        let entry = SimpleEntry(
            date: now,
            timeline: service.state(at: now, startedAt: startDate)
        )

        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        
        let now = Date()
        let startDate = TimelineSimulationTime.startDate ?? now
     
        var entries: [SimpleEntry] = []
        
        let elapsed = max(0, now.timeIntervalSince(startDate))
        
        let nextStep = Int(elapsed / service.interval) + 1
        
        // Estado atual
        entries.append(
            SimpleEntry(
                date: now,
                timeline: service.state(
                    at: now,
                    startedAt: startDate
                )
            )
        )
        
        // Próximos estados da simulação
        for step in nextStep..<(nextStep + 40) {
            
            let entryDate = startDate.addingTimeInterval(
                Double(step) * service.interval
            )
            
            entries.append(
                SimpleEntry(
                    date: entryDate,
                    timeline: service.state(
                        at: entryDate,
                        startedAt: startDate
                    )
                )
            )
        }
        
        completion(
            Timeline(
                entries: entries,
                policy: .atEnd
            )
        )
        
    }
}
    
struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeline: TimelineState
}

struct BlackBirdWidgetEntryView : View {
    
    @Environment(\.widgetFamily) var family
    
    var entry: Provider.Entry
    
    var body: some View {
        
        Group {
            switch family {
                
            case .systemSmall:
                TimelineWidgets(
                    timeline: entry.timeline
                )
                
            case .systemMedium:
                TimelineMedium(
                    timeline: entry.timeline
                )
                
            case .systemLarge:
                TimelineLarge(
                    timeline: entry.timeline
                )
                
            case .systemExtraLargePortrait:
                TimelineLargeLarge(
                    timeline: entry.timeline
                )
                
            default:
                TimelineWidgets(
                    timeline: entry.timeline
                )
            }
        }
        .widgetURL(
            URL(string: "blackbird://cronograma")
        )
    }
}

struct BlackBirdWidget: Widget {
    let kind: String = "BlackBirdWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                BlackBirdWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                BlackBirdWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Cronograma")
        .description("Acompanhe suas próximas aulas.")
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .systemExtraLargePortrait
        ])
    }
}

#Preview(as: .systemSmall) {
    BlackBirdWidget()
} timeline: {
    
    SimpleEntry(
        date: .now,
        timeline: TimelineState(
            dayIndex: 0,
            completedCount: 0,
            classes: DemoTimelineDays.days[0]
        )
    )
    
    SimpleEntry(
        date: .now.addingTimeInterval(30),
        timeline: TimelineState(
            dayIndex: 0,
            completedCount: 1,
            classes: DemoTimelineDays.days[0]
        )
    )
    
    SimpleEntry(
        date: .now.addingTimeInterval(60),
        timeline: TimelineState(
            dayIndex: 0,
            completedCount: 2,
            classes: DemoTimelineDays.days[0]
        )
    )
    
    SimpleEntry(
        date: .now.addingTimeInterval(90),
        timeline: TimelineState(
            dayIndex: 0,
            completedCount: 3,
            classes: DemoTimelineDays.days[0]
        )
    )
    
    SimpleEntry(
        date: .now.addingTimeInterval(120),
        timeline: TimelineState(
            dayIndex: 1,
            completedCount: 0,
            classes: DemoTimelineDays.days[1]
        )
    )
}
