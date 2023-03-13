//
// File: TextEdittestView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 11/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct TextEditTestView: View {

    @State private var textField1: String = ""
    @State private var textField2: String = ""
    @State private var textNote: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            FloatingTextView("Input Field 1", text: $textField1)
            FloatingTextView("Input Field 2", text: $textField2)

            TextEdit(placeholder: "Placeholder Text", text: $textNote)
                .frame(height: 140)

            Divider().padding(.vertical, 20)
            Text("Text field 1: \(textField1)")
            Text("Text field 2: \(textField2)")
            Text("The note field:")
            Text(textNote)
            Spacer()
        }
        .padding()
        .navigationTitle("Text Editors")
    }
}

struct TextEdittestView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditTestView()
    }
}
