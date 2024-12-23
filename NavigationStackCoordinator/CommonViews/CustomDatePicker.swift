//
//  CustomDatePicker.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 23/12/2024.
//

import SwiftUI

enum DatePickerStyle {
    case graphical
    case wheel
}

struct CustomDatePicker: View {
    @Binding var selectedDate: Date
    let displayComponents: DatePickerComponents
    private let style: DatePickerStyle
    private let tint: Color

    init(
        selection: Binding<Date>,
        displayedComponents: DatePickerComponents = [.date],
        style: DatePickerStyle,
        tint: Color = Color(.accentColorFF007E)
    ) {
        self._selectedDate = selection
        self.displayComponents = displayedComponents
        self.style = style
        self.tint = tint
    }

    var body: some View {
        Group {
            if style == .graphical {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: displayComponents
                )
                .datePickerStyle(.graphical)
            } else if style == .wheel {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: displayComponents
                )
                .datePickerStyle(.wheel)
            }
        }
        .tint(tint)
    }
}
