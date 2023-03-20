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
    @State private var dateNow2Months: Date?
    @State private var dateTimeInFuture: Date?
    @State private var dateTimePast: Date?
    
    @State private var dateTime: Date?
    @State private var showDateTime: Bool = false
    @State private var showNoClear: Bool = false
    @State private var showNow2Months: Bool = false
    @State private var showDateTimeInFuture: Bool = false
    @State private var showDateTimePast: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Tap the date to open the picker.")
                Form {
                    Section("Date only") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateOnly,
                                             showPicker: $showDateOnly,
                                             showTimeComponent: false)
                    }
                    
                    Section("Date and Time") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateTime,
                                             showPicker: $showDateTime)
                    }
                    
                    Section("Date/Time without Clear") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateNoClear,
                                             showPicker: $showNoClear)
                    }
                    
                    Section("Date/time between Now and +2 Months") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateNow2Months,
                                             showPicker: $showNow2Months)
                    }
                    
                    Section("Date/time in future") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateTimeInFuture,
                                             showPicker: $showDateTimeInFuture)
                    }
                    
                    Section("Date/time in the past") {
                        DateTimePickerButton(label: "",
                                             dateTime: $dateTimePast,
                                             showPicker: $showDateTimePast)
                    }
                }
            }
            .padding()
            .navigationTitle("Date/Time picker")
            .blur(radius: showingPopup() ? 8 : 0)
            
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
            
            if showNow2Months {
                DateTimePopup(selectedDate: $dateNow2Months,
                              showPopup: $showNow2Months,
                              minDate: dateTimeNow(),
                              maxDate: dateTimePlus2Months())
            }
            
            if showDateTimeInFuture {
                DateTimePopup(selectedDate: $dateTimeInFuture,
                              showPopup: $showDateTimeInFuture,
                              minDate: dateTimeNow())
            }
            
            if showDateTimePast {
                DateTimePopup(selectedDate: $dateTimePast,
                              showPopup: $showDateTimePast,
                              maxDate: dateTimeNow())
            }
        }
    }
    
    func dateTimeNow() -> Date {
        Date.now
    }
    
    func dateTimePlus2Months() -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: 2, to: dateTimeNow())!
    }
    
    func showingPopup() -> Bool {
        return showDateOnly
        || showNoClear
        || showDateTime
        || showNow2Months
        || showDateTimePast
        || showDateTimeInFuture
    }
}

struct DateTimeTestView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeTestView()
    }
}
