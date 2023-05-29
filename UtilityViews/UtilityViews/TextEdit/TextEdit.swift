//
// File: TextEdit.swift
// Package: UtilityViews
// Created by: Steven Barnett on 15/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
The TextEdit component provides a text input component that accepts multiple lines of text
with the advantage of having place holder text.

 ![Text Edit](TextEdit.png)
 
 When the TextEdit is empty, the placeholder text will be displayed using the placeholder foreground colour.
 When the user tarts typing text, the placeholder will be shrunk and moved to the top of the edit component,
 allowing the user to continue to see it, but moving it wou of the way of the text they are entering. This helps
 give context to the information
  being input.
 
Usage scenario:

````
 @State private var address: String = ""
 
 Section("Contact") {
     TextEdit(placeholder: "Address", text: $address)
         .frame(minHeight: 100)
 }
````

*/
public struct TextEdit: View {

    /// Defines the placeholder text that will be visible when the TextEdit component is empty. This is intended to
    /// inform the user what input is expected.
    var placeholder: String

    /// A bound string variable where the input text will be saved.
    @Binding public var text: String

    /// Initiaises the TextEdit component by setting the placeholder text and abinding for the entered
    /// text to a variable.
    ///
    /// - Parameters:
    ///   - placeholder: The place holder text to be displayed when the component is empty. This will be minimised
    ///   when the user starts entering text.
    ///   - text: A binding to a string variable to provide the initial text and where the updated text will be saved.
    public init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text

        // We need to make the background transparent or we end up with
        // a stark white or black background. This does not match the
        // background of other input controls.
        UITextView.appearance().backgroundColor = .clear
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                Text(placeholder)
                    .font(.body)
                    .padding(.leading, 1)
                    .foregroundColor(text.isEmpty ? .primary : .primary.opacity(0.75))
                    .offset(y: text.isEmpty ? 12.5 : -0.85)
                    .scaleEffect(text.isEmpty ? 1 : 0.65, anchor: .leading)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5), value: text)
                Spacer()
            }

            VStack {
                TextEditor(text: $text)
                    .opacity(text.isEmpty ? 0.6 : 1)
                Spacer()
            }.padding(.top, 15)
                .animation(.spring(response: 0.2, dampingFraction: 0.5), value: text)
        }
    }
}

struct CustomTextEditor_Previews: PreviewProvider {

    @State static var testText: String = ""

    static var previews: some View {
        TextEdit(placeholder: "Type Text",
                         text: $testText)
        .previewLayout(.sizeThatFits)
        .frame(width: 300, height: 300)
    }
}
