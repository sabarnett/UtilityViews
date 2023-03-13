//
// File: KeyValueView.swift
// Package: UtilityViews
// Created by: Steven Barnett on 24/02/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 This is a helper view that simplifies the code necessary to display a key/value pair.
 
 ![Key Value View](KeyValueView.png)
 
 The key will be displayed on the leading edge and the value on the trailing. When implemented
 in code, this will require the definition of an HStack containing a Text view, a Spacer and a second
 Text view. When used with any significant number of key/value pairs, this can introduce a great deal
 of code into the view.
 
 This helper view wraps the HStack/Text combination so it can be reduced to a single line in the calling view.
 
 KeyValueView has two usage scenarios. The first is where the key and the value are expressed as strings.
 The second allows the key to be passed as an Image. This second sceanrio is useful when you wish to
 use an SF Symbol as the key indicator.
 
 Usage scenario:

````
 KeyValueView(image: Image(systemName: "airplane.departure"), value: vm.takeoffDate)
````

 */
public struct KeyValueView: View {

    @Environment(\.layoutDirection) var direction

    private let icon: Image?
    private let key: String
    private let value: String

    /// Initialise the KeyValueView with strings for the key and value pairs.
    ///
    /// - Parameters:
    ///   - key: The key value to display on the left.
    ///   - value: The value to display on the right
    public init(key: String, value: String) {
        self.key = key
        self.value = value
        self.icon = nil
    }

    /// Initialise the KeyValueView with an image for the key and a string for the value.
    ///
    /// - Parameters:
    ///   - image: The image to display on the left of the control.
    ///   - value: The value to display on the right of the control.
    public init(image: Image, value: String) {
        self.key = ""
        self.value = value
        self.icon = image
    }

    public var body: some View {
        HStack {
            if direction == .leftToRight {
                keyContent()
                Spacer()
                valueContent()
            } else {
                valueContent()
                Spacer()
                keyContent()
            }
        }
    }

    func keyContent() -> some View {
        if let icon {
            return AnyView(icon)
        }
        return AnyView(Text(key))
    }

    func valueContent() -> some View {
        Text(value)
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KeyValueView(key: "Key Value", value: "Value Value")
            KeyValueView(image: Image(systemName: "checkmark"), value: "Setting")
        } .previewLayout(.sizeThatFits)
    }
}
