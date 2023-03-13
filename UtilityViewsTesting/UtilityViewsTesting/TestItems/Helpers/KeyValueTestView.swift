//
// File: KeyValueTestView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 09/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct KeyValueTestView: View {
    var body: some View {
        VStack {
            List {
                Section("KeyValueView") {
                    KeyValueView(key: "Key", value: "Value")
                    KeyValueView(key: "Today", value: Date().formatted(
                        .dateTime.day().month(.wide).year() ))
                    KeyValueView(image: Image(systemName: "checkmark"), value: "This item is done")
                        .foregroundColor(Color(.systemGreen))
                    KeyValueView(image: Image(systemName: "xmark"), value: "Yet to be done")
                        .foregroundColor(Color(.systemRed))
                }

                Section("CheckBoxView") {
                    CheckBoxView(caption: "This is done", checked: true)
                    CheckBoxView(caption: "This is not done", checked: false)
                    CheckBoxView(caption: "Not sure about this one", checked: nil)
                }
            }
            Spacer()
        }.navigationTitle("KeyValue & Checkbox")
    }
}

struct KeyValueTestView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueTestView()
    }
}
