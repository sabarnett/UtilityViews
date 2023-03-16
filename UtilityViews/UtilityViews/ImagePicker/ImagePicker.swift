//
// File: ImagePicker.swift
// Package: UtilityViews
// Created by: Steven Barnett on 13/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//
        
import SwiftUI

/**
 The image picker allows the user to select an image from their photos library or to take a picture with the camera.
 
 ![Image Picker](ImagePicker.png)
 
Depending on the `sourceType` you can elect to use an existing picture on the device or to take a new
 picture using the devices camera.
 
 Usage scenario:

````
 @State private var selectedImage: UIImage = UIImage()
 @State private var showSelector: Bool = false
 
 var body: some View {
     VStack {
         if let selectedImage {
         Image(uiImage: selectedImage)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 250, height: 250)
         }

         Button("Select Image") { showSelector.toggle() }
     }
     .padding()
     .sheet(isPresented: $showSelector) {
         ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
     }
     
 }
````
 */
public struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding public var selectedImage: UIImage

    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    /// Initialises the Image Picker, providing a binding to the resulting image and specifying the source to take
    /// the image from (photo library or camera).
    ///
    /// - Parameters:
    ///   - selectedImage: A binding to a UIImage to save the selected image to. If the user cancels the selection,
    ///         the original image will be left untouched.
    ///   - sourceType: The source of the image; photo lobrary or camera, for example
    public init(selectedImage: Binding<UIImage>, sourceType: UIImagePickerController.SourceType) {
        self._selectedImage = selectedImage
        self.sourceType = sourceType
    }
    
    /// Constructs an instance of the UIImagePicketController
    public func makeUIViewController(
        context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }
    
    /// Updates the IOImagePickerController. In this contect, this function does nothing.
    public func updateUIViewController(_ uiViewController: UIImagePickerController,
                                       context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
    /// Makes the coordinator for the image picket
    /// - Returns: An instance of a Coordinator()
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// The Coordinateor implementation for the image picker. This class is responsible for translating the
    /// image the user selects into the returned image property of the image picker class.
    public final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        public init(_ parent: ImagePicker) {
            self.parent = parent
        }

        public func imagePickerController(_ picker: UIImagePickerController,
                                          didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.dismiss()
        }

    }
}
