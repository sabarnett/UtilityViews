//
// File: PDFViewPlaying.swift
// Package: UtilityViews
// Created by: Steven Barnett on 20/06/2023
//
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 The PDFViewer component presents a PDF file to the user that they can view or, optionally, edit. The
 PDF will be scaled to fit automatically when displayed. To the top right of the view is a share icon
 that can be used to print or markup the document.
 
 ![PDF Viewer](PDFViewer.png)

 The PDFViewer expects a single parameter that contains the data from the PDF file to be displayed.
  
 Usage scenario:

````
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
````
 */
public struct PDFViewer: View {

    private var pdfData: Data?
    @State private var showShareSheet: Bool = false
    
    /// Initialises the PDF viewer and passes in the PDF file data to be dispplayed.
    ///
    /// - Parameter pdfData: The PDF file expressed as Data
    public init(pdfData: Data? = nil) {
        self.pdfData = pdfData
    }
    
    public var body: some View {
        VStack {
            PDFViewUI(data: pdfData, autoScales: true)
                .overlay(
                    Button(action: {
                        showShareSheet = true
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .scaleEffect(1)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(.black)
                            .clipShape(Circle())
                    }).offset(x: -10, y: 10),
                    alignment: .topTrailing)
        }

        .sheet(isPresented: $showShareSheet) {
            if let pdfData {
                ShareView(activityItems: [pdfData])
            }
        }
    }
}
