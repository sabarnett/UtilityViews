//
// File: XDismissButton.swift
// Package: UtilityViews
// Created by: Steven Barnett on 15/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 XDsmissButton provides a consistently styled image to be used in conjunction with an overlay to close
 a popup modal.
 
 ![Dismiss Button](XDismissButton.png)
 
 In itself, the XDismissBuoon provides no functionality. It is a visual representation of a close button intended to
 ensurea consistent look to the user.
 
 Popups can be closed by the user by simply dragging the popup down. This is often the desired functionality, but
 can cause problems if they are, for example, filling out a form. We can stop the drag to close functionaloity by adding
 the 'interactiveDismissDisabled' modifier. However, if we do this, we need to procvide the user with a way to close the
 popup. This is where XDismissButton comes in to use.
 
 Usage scenario:

````
 @Environment(\.dismiss) private var dismiss
 
 .interactiveDismissDisabled(true)
 .overlay(alignment: .topTrailing) {
     if readonlyModal {
         Button {
             dismiss()
         } label: {
             XDismissButton()
         }
     }
 }
````
 
 
 */
public struct XDismissButton: View {

    public init() {}

    public var body: some View {
        Image(systemName: "x.circle.fill")
            .font(Font.body.weight(.bold))
            .foregroundColor(.primary)
            .frame(width: 44, height: 44)
            .scaleEffect(1.5)
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
