//
// File: FloatingTextView.swift
// Package: UtilityViews
// Created by: Steven Barnett on 09/02/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
FloatingTextView is a variation on the standard TextInput input component that keeps the placeholder text visible
 on screen as the user types their input.

 ![Floating Text View](FloatingTextView.png)
 
 When the FloatingTextView is empty, the placeholder text is displayed as it would be in a standard
 TextField. As the user starts to type their input, the placeholder is minimised and moved to the top
 of the component, where is remains visible to the user, providing them with a reminder of what input was expected.
 
Usage scenario:

````
 @State private var firstName: String = ""
 
 Section("Name") {
     FloatingTextView("First Name", text: $firstName)
 }
````


*/
public struct FloatingTextView: View {

    let title: String
    @Binding public var text: String

    /// Initialises a FloatinfTextView, providing the placeholder text and the bound string variable
    /// to store the input into.
    ///
    /// - Parameters:
    ///   - title: Specifies the placeholder text to appear in the component. This will minimise to the top of the
    ///   component when the user starts typing.
    ///   - text: A binding to a string variable for the input text.
    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.primary.opacity(0.65))
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1 : 0.8, anchor: .leading)
            TextField("", text: $text)
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.2, dampingFraction: 0.5), value: text)
    }
}

struct FloatingTextView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextView("Prompt", text: .constant(""))
    }
}
