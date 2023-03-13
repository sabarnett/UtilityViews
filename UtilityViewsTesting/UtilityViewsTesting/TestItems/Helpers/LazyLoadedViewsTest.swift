//
// File: LazyLoadedViewsTest.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 11/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct LazyLoadedViewsTest: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Just by displaying these, you should get a debug message that they have loaded.")
                ForEach(1...5, id: \.self) { viewId in
                    NavigationLink(destination: {
                        LazyLoadedDestinationView(viewNumber: viewId)
                    }, label: {
                        Text("Not Lazy Loaded View \(viewId)")
                    })
                }.padding(.leading, 40)

            Divider().padding(.vertical, 20)
            Text("These views will not display a debug message until they " +
                 "are clicked on. They will also be re-initialised each time " +
                 "they are tapped.")
                ForEach(10...15, id: \.self) { viewId in
                    NavigationLink(destination: {
                        LazyLoadedView {
                            LazyLoadedDestinationView(viewNumber: viewId)
                        }
                    }, label: {
                        Text("Lazy loaded view: \(viewId)")
                    })
                }.padding(.leading, 40)

            Spacer()
        }
        .padding()
        .navigationTitle("LazyLoadedView")
    }
}

struct LazyLoadedDestinationView: View {

    @State var viewNumber: Int

    init(viewNumber: Int) {
        self.viewNumber = viewNumber
        print("\(viewNumber) view loaded")
    }

    var body: some View {
        VStack {
            Text("Lazy loaded view \(viewNumber)")
        }
    }
}

struct LazyLoadedViewsTest_Previews: PreviewProvider {
    static var previews: some View {
        LazyLoadedViewsTest()
    }
}
