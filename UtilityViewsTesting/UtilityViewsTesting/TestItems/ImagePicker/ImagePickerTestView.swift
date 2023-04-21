//
// File: ImagePicker.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 13/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//
        
import SwiftUI
import UtilityViews

struct ImagePickerTestView: View {
    
    @State private var selectedImage: UIImage = UIImage()
    @State private var showSelector: Bool = false
    
    var body: some View {
        VStack {
            Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)

            Button("Select Image") { showSelector.toggle() }
        }
        .padding()
        .sheet(isPresented: $showSelector) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
        }
        
    }
}

struct ImagePickerTest_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerTestView()
    }
}
