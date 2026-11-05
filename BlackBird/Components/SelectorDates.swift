//
//  SelectorDates.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct SelectorDates: View {

    @Binding var selectedDate: Date

    @State private var showCalendar = false

    var body: some View {

        VStack(alignment: .leading) {

            Button {
                showCalendar = true
            } label: {

                HStack(spacing: 12) {

                    Text(selectedDate.formatted(
                        .dateTime
                            .month(.wide)
                            .year()
                            .locale(Locale(identifier: "pt_BR"))
                    ))
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)

                    Image(systemName: "chevron.down")
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.plain)

        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, alignment: .leading)

        .sheet(isPresented: $showCalendar) {

            DatePicker(
                "Selecione uma data",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .labelsHidden()
            .padding()
            .presentationDetents([.medium])
        }
    }
}
