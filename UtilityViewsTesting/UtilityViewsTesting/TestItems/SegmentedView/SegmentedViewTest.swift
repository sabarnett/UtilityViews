//
// File: SegmentedViewPlaying.swift
// Package: Tester
// Created by: Steven Barnett on 18/05/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct SegmentedViewTest: View {
    let items = ["Details", "Pilot", "Pre-flight",
                 "Flight", "Post-Flight", "Notes",
                 "Help", ">20Kg"]

    @State private var selectedSegment: String = ""
    @State private var altSegmentSelected: String = ""

    var body: some View {
        VStack {
            SegmentedView(segments: items,
                          showBackground: false,
                          segmentStyle: .underline,
                          underlineColor: Color(.systemGreen),
                          underlineTextColor: Color(.systemGreen),
                          selected: $selectedSegment)

            Text(selectedSegment)
                .padding(.vertical, 30)

            SegmentedView(segments: items,
                          segmentStyle: .pill,
                          selected: $altSegmentSelected)
            Text(altSegmentSelected)
                .padding(.vertical, 30)

            Spacer()
        }
        .onAppear {
            if selectedSegment.isEmpty {
                selectedSegment = items.first!
                altSegmentSelected = items[1]
            }
        }
    }
}

struct SegmentedViewPlaying_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedViewTest()
    }
}
