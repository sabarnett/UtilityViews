//
// File: DateTimePicker.swift
// Package: UtilityViews
// Created by: Steven Barnett on 21/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 The DateTimePickerButton presents a date and time view on the screen. When tapped, it toggles a
 bound property that can be used to display a ``DateTimePopup`` to select a date and time value.
 
 ![Date Time Picker Button](DateTimePickerButton.png)

 DateTimePickerButton expects three arguments;
 
 * The label to display that describes the purpose of the date.
 * A bound Date variable to provide the initial date/time and to receive the updated value.
 * A bound Bool which will be toggled when the user taps the component. It is used
 to trigger the display of the ``DateTimePopup``.
 
 If the date/time is passed as nil, then it is assumed that no date/time has been set so the text 'Not Set' will
 be displayed.
 
 Usage scenario:

````
 @ObservedObject var editViewModel: FlightEditViewModel
 @Binding var showTakeoffPicker: Bool
 
 var body: some View {
     VStack(alignment: .leading, spacing: 20) {
         DateTimePickerButton(label: "Take-off",
                        dateTime: $editViewModel.takeOff,
                        showPicker: $showTakeoffPicker)
````
 
 */
public struct DateTimePickerButton: View {

    public var label: String
    @Binding public var dateTime: Date?
    @Binding public var showPicker: Bool
    private var showTimeComponent: Bool

    /// Initialise the DateTimePicketButton.
    /// - Parameters:
    ///   - label: The label to be displayed. This should indicate to the user what the date time represents.
    ///   - dateTime: A bound Date variable that provides the initial value and receives the selected date and time.
    ///   - showPicker: A bound Bool that is toggled when the user taps the component.
    ///   - showTimeComponent: Indicates whether you want the time displayed or not. By default, the
    ///   time will be displayed.
    ///
    public init(label: String, dateTime: Binding<Date?>, showPicker: Binding<Bool>, showTimeComponent: Bool = true) {
        self.showTimeComponent = showTimeComponent
        self.label = label
        self._dateTime = dateTime
        self._showPicker = showPicker
    }

    public var body: some View {
        KeyValueView(key: label, value: displayDate)
        .onTapGesture {
            withAnimation {
                showPicker.toggle()
            }
        }
    }

    var displayDate: String {
        // Format the date and time.
        if let dateTime = dateTime {
            return showTimeComponent
                ? dateTime.appDateTime
                : dateTime.appDate
        } else {
            return "Not Set"
        }
    }
}
