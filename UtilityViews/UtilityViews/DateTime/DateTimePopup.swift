//
// File: DateTimePopup.swift
// Package: UtilityViews
// Created by: Steven Barnett on 21/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 The DateTimePopup presents a date and time picker view. Typically triggered by a ``DateTimePickerButton``, the
 picker is presented as a popup modal window. The background will be greyed out so no further input is allowed until
 the picker is closed.
 
 ![Date Time Popup](DateTimePopup.png)

 The calling view must implement a top level ZStack as the date time popup will be presented over the top of the
 current view.
 
  **Note** the picker is only for picking dates before the current date/time. If you want to pick a date in the future,
 you will need to set the maxDate initialiser property.
 
 Usage scenario:

````
 @State private var showTakeoffPicker: Bool = false
 
 
 var body: some View {
     ZStack {
            ...
 
     if showTakeoffPicker {
         DateTimePopup(selectedDate: $editViewModel.takeOff,
                       showPopup: $showTakeoffPicker)
         .transition(.scale)
     }
````
 
 */
public struct DateTimePopup: View {

    @Binding public var selectedDate: Date?
    @Binding public var showPopup: Bool
    @State var selDate: Date = Date()
    private var minDate: Date?
    private var maxDate: Date?
    private var showTimePicker: Bool
    private var allowClear: Bool

    /// Initialise the DateTimePopup
    /// - Parameters:
    ///   - selectedDate: A bound Date variable that provides the initial value and where
    ///                 the updated value will be stored.
    ///   - showPopup: A bound Bool that will be toggled when the user selects a date ot cancells the popup.
    ///   - minDate: The minimum allowed date and time that can be entered. If not set, it will default to
    ///              todays date minus 10 years.
    ///   - maxDate: Sets the maximum allowable date that can be selected. If not set, it will default to the
    ///             current date/time = 24 hours.
    ///   - showTimePicker: Indicates whether you want the time picker displayed or not. By default, the
    ///   time picker will be displayed.
    ///   - allowClear: Indicates that the user should bebale to clear the date and time. If enabled a clear
    ///   button will be displayed. If pressed, the selected date is set to nil and the popup is closed.
    ///   
    public init(selectedDate: Binding<Date?>,
                showPopup: Binding<Bool>,
                minDate: Date? = nil,
                maxDate: Date? = nil,
                showTimePicker: Bool = true,
                allowClear: Bool = true) {
        self.showTimePicker = showTimePicker
        self.minDate = minDate
        self.maxDate = maxDate
        self.allowClear = allowClear

        self._selectedDate = selectedDate
        self._showPopup = showPopup
    }

    public var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Button("Select") {
                            selectedDate = selDate
                            withAnimation {
                                showPopup = false
                            }
                        }.padding()
                        
                        if allowClear {
                            Spacer()
                            Button("Clear") {
                                selectedDate = nil
                                withAnimation {
                                    showPopup = false
                                }
                            }.padding()
                        }
                        
                        Spacer()
                        Button("Cancel") {
                            withAnimation {
                                showPopup = false
                            }
                        }.padding()
                    }
                    .background(Color(.darkGray))
                    .foregroundColor(.white)

                    DatePicker("Select date",
                               selection: $selDate,
                               in: dateRange(),
                               displayedComponents: displayComponents())
                    .datePickerStyle(.graphical)   //(GraphicalDatePickerStyle())
                        .padding()
                }
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .frame(maxWidth: 400, maxHeight: 450)
                .padding(.horizontal, 10)
                Spacer()
            }
        }
        .padding()
        .onAppear {
            if let defaultDate = selectedDate {
                selDate = defaultDate
            } else {
                selDate = Date()
            }
        }
    }

    func dateRange() -> ClosedRange<Date> {
        let calendar = Calendar.current

        // Start date - minimum date or 10 years ago
        let yearComp = DateComponents(year: -10)
        var startDate = calendar.date(byAdding: yearComp, to: Date())!

        if let minDate {
            startDate = minDate
        }

        // Make some allowance on end date - allow up to 24 hours past 'now' so we can log
        // a date in the near future. That lets the user set a take-off date before they
        // take off.
        var endDate = calendar.date(byAdding: DateComponents(day: 1), to: Date())!
        if let maxDate {
            endDate = maxDate
        }

        return startDate...endDate
    }

    func displayComponents() -> DatePicker.Components {
        return showTimePicker
            ? [.date, .hourAndMinute]
            : [.date]
    }
}
