//
// File: CheckBoxView.swift
// Package: UtilityViews
// Created by: Steven Barnett on 24/02/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 This is a helper view that simplifies the code necessary to display a piece of text
 and a checkbox value. This will be a check box, a cross or an empty square depending
 on the value to be presented.
 
 ![Check Box View](CheckBoxView.png)
 
 The component is passed two values, the text to be displayed on the leading edge of the screen and
 an optional boolean to indicate the state. Dependiing on the value of the bool, the trailing
 edge of the control will show
 
 * true: A check mark
 * false: a cross
 * nil: an empty square box.
 
 The colour of the text and the indicator will also be set to either green, red or blue.
 
 Usage scenario:

````
 @State var isOn: Bool?
 
 CheckBoxView(caption: "Checks Performed", checked: isOn)
````

 */
public struct CheckBoxView: View {

    @Environment(\.layoutDirection) var direction

    private let caption: String
    private let checked: Bool?

    /// Initiaalises the component ith the text to display and the state of the check box.
    /// - Parameters:
    ///   - caption: The text to be displayed as the description of the value
    ///   - checked: An optional bool containing the state to be represented.
    public init(caption: String, checked: Bool?) {
        self.caption = caption
        self.checked = checked
    }

    public var body: some View {
        HStack {
            if direction == .leftToRight {
                AnyView(Text(caption))
            } else {
                AnyView(Image(systemName: checkIcon()))
            }
            Spacer()
            if direction == .leftToRight {
                AnyView(Image(systemName: checkIcon()))
            } else {
                AnyView(Text(caption))
            }
        }.foregroundColor(textColour())
    }

    private func checkIcon() -> String {
        guard let checked else {
            return "square"
        }
        return checked ? "checkmark" : "xmark"
    }

    private func textColour() -> Color {
        guard let checked else {
            return Color(.systemBlue)
        }
        return checked ? Color(.systemGreen) : Color(.systemRed)
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckBoxView(caption: "Tick Box", checked: true)

            CheckBoxView(caption: "Tick Box", checked: false)

            CheckBoxView(caption: "Tick Box", checked: nil)

        }.previewLayout(.sizeThatFits)
    }
}
