//
// File: XDismissButtonView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 09/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct XDismissButtonView: View {

    @State var showModal: Bool = false

    var body: some View {
        VStack {
            Text("This form tests the XDismissButton control. Tap " +
                 "the **Show Modal** button to display the modal and " +
                 "the dismiss button.")
                .padding(.bottom, 30)
            Button("Show Modal") {
                showModal.toggle()
            }
        }
        .navigationTitle("XDismissButton")
        .padding()
        .sheet(isPresented: $showModal) {
            XDismissButtonModalView()
        }
    }
}

struct XDismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButtonView()
    }
}
