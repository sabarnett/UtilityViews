//
// File: PickerPopupButton.swift
// Package: UtilityViews
// Created by: Steven Barnett on 17/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
  Displays a button that can be used to display a picker item. When tapped, the button sets the state
   of the showPicker bound variable to true. This can then be used to display the picker overlay.
 
  Usage scenario:
 
 ````
 @State private var showPicker1: Bool = false
 @State private var selectedPilot: PickerOption?
 
 ZStack {
     VStack {
       PickerPopupButton(selectedItem: currentPilot, showPicker: $showPicker1)
     }
     .blur(radius: showPicker1 ? 8 : 0)
 
     PickerPopup(pickerOptions: pilotList,
             prompt: "Select a pilot from the list",
             show: $showPicker1,
             selectedOption: $selectedPilot)
   }
  ````
 
  Having your view contained in a ZStack is mandarory as the popup selection window will
   be added over the top of the calling window.
 */
public struct PickerPopupButton: View {

    public var selectedItem: PickerOption
    @Binding public var showPicker: Bool
    
    /// Displays a 'button' that can be used to toggle the display of the picker selection view. The button is
    /// passed the `PickerOption` to be displayed and a binding to a boolean that is used to trigger
    /// the display of the picker popup in the parent code.
    ///
    /// - Parameters:
    ///   - selectedItem: The item to ne displayed
    ///   - showPicker: A binding to a bool. Will be set to true if the user taps the displayed item.
    public init(selectedItem: PickerOption, showPicker: Binding<Bool>) {
        self.selectedItem = selectedItem
        self._showPicker = showPicker
    }

    public var body: some View {
        HStack {
            PopupItem(option: selectedItem)
            Spacer()
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: pickerAnimationDuration)) {
                showPicker.toggle()
            }
        }
    }
}
