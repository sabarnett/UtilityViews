//
// File: DateTimeTestView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 11/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct DateTimeTestView: View {

    @State private var dateOnly: Date?
    @State private var showDateOnly: Bool = false
    @State private var dateNoClear: Date?

    @State private var dateTime: Date?
    @State private var showDateTime: Bool = false
    @State private var showNoClear: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Text("Tap the date to open the picker.")

                DateTimePickerButton(label: "Date Only",
                                     dateTime: $dateOnly,
                                     showPicker: $showDateOnly,
                                     showTimeComponent: false)

                DateTimePickerButton(label: "Date & Time",
                                     dateTime: $dateTime,
                                     showPicker: $showDateTime)

                DateTimePickerButton(label: "Date & Time No Clear",
                                     dateTime: $dateNoClear,
                                     showPicker: $showNoClear)
                Spacer()
            }
            .padding()
            .navigationTitle("Date/Time picker")

            if showDateOnly {
                DateTimePopup(selectedDate: $dateOnly,
                              showPopup: $showDateOnly,
                              showTimePicker: false)
                .transition(.scale)
            }

            if showDateTime {
                DateTimePopup(selectedDate: $dateTime,
                              showPopup: $showDateTime)
                .transition(.scale)
            }
            
            if showNoClear {
                DateTimePopup(selectedDate: $dateNoClear,
                              showPopup: $showNoClear,
                              allowClear: false)
            }
        }
    }
}

struct DateTimeTestView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeTestView()
    }
}
