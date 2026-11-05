//
//  DaysCarousel.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//

import SwiftUI

struct DaysCarousel: View {
    
    @Binding var selectedDate: Date

    
    private let calendar = Calendar.current
    
    private var days: [Date] {
    
        guard let monthStart = calendar.dateInterval(
            of: .month, for: selectedDate)?.start
                else {
            return []
        }
        
        return (-45...75).compactMap { offset in //return tipo Date. Pega datas para mostrar desde antes do INICIO do mes e depois
            calendar.date(
                byAdding: .day,
                value: offset,
                to: monthStart
            )
        }
    }

var body: some View {
    ScrollViewReader { selected in
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(days, id: \.self) { day in
                    dayItem(day)
                        .id(day)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .onAppear {
            scrollToSelected(selected)
        }
        .onChange(of: selectedDate) { _, _ in
            withAnimation(.easeInOut) {
                scrollToSelected(selected)
            }
        }
    }
}

private func dayItem(_ date: Date) -> some View {

    let isSelected = calendar.isDate(
        date,
        inSameDayAs: selectedDate
    )

    return Button {
        selectedDate = date
    } label: {

        VStack(spacing: 14) {

            Text(date.formatted(
                .dateTime
                .weekday(.abbreviated)
                .locale(Locale(identifier: "pt_BR"))
                )
            )
            .font(.title2)
            .foregroundStyle(
                isSelected ? .black : .secondary
            )

            Text(date.formatted(.dateTime.day()))
            .font(.title2)
            .foregroundStyle(
                isSelected ? .black : .primary
            )

        }
        .frame(width: 65, height: 100)
        .background(
            isSelected
            ? Color(.yellowFolder)
            : Color(.card)
        )
        .clipShape(Capsule())
    }
    .buttonStyle(.plain)
}

private func scrollToSelected(_ selected: ScrollViewProxy) {
    selected.scrollTo(
    calendar.startOfDay(for: selectedDate),
            anchor: .center
        )
    }
}
