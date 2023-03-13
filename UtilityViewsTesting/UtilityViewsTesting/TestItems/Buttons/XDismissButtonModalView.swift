//
// File: XDismissButtonModalView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 09/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct XDismissButtonModalView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("This is our modal form.")
                Text("Tap the X to close the modal.")
            }
        }
        .interactiveDismissDisabled(true)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                dismiss()
            }, label: {
                XDismissButton()
            })
        }
    }
}

struct XDismissButtonModalView_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButtonModalView()
    }
}
