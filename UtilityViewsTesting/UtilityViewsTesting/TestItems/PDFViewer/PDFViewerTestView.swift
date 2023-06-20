//
// File: PDFViewerTestView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 20/06/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct PDFViewerTestView: View {

    @State private var data: Data?

    var body: some View {
        PDFViewer(pdfData: data)
            .navigationTitle(Text("PDF File Viewer"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                if let pdfUrl = Bundle.main.url(forResource: "RandomActs", withExtension: "pdf") {
                    self.data = try? Data.init(contentsOf: pdfUrl)
                }
            })
    }
}
