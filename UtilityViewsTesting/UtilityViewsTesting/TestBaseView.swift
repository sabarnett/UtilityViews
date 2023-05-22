//
// File: ContentView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 09/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

struct TestBaseView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: {
                        XDismissButtonView()
                    }, label: { Text("XDismissButton") })

                    NavigationLink(destination: {
                        KeyValueTestView()
                    }, label: {Text("KeyValueView & CheckBoxView") })

                    NavigationLink(destination: {
                        LazyLoadedViewsTest()
                    }, label: {Text("LazyLoadedView") })

                    NavigationLink(destination: {
                        DateTimeTestView()
                    }, label: {Text("Date/Time picker")})

                    NavigationLink(destination: {
                        TextEditTestView()
                    }, label: {Text("Text Edit Views")})

                    NavigationLink(destination: {
                        ImagePickerTestView()
                    }, label: {Text("Image Picker")})
                    
                    NavigationLink(destination: {
                        PopupListPickerTestView()
                    }, label: {Text("Popup List Picker")})
                    
                    NavigationLink(destination: {
                        SegmentedViewTest()
                    }, label: {Text("Segmented View")})
                }
            }
            .navigationTitle("UtilityViews Tests")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestBaseView()
    }
}
