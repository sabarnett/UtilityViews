//
// File: PickerPopup.swift
// Package: UtilityViews
// Created by: Steven Barnett on 17/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
  Displays a popup window containing a list to select from. Each item will have a leading
   image followed by a title and sub-title.
 
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
public struct PickerPopup: View {

    public var pickerOptions: [PickerOption]
    public var prompt: String?

    @Binding public var selectedOption: PickerOption?
    @Binding public var showPopup: Bool

    public init(pickerOptions: [PickerOption],
                prompt: String? = nil,
                selectedOption: Binding<PickerOption?>,
                showPopup: Binding<Bool>) {
        self.pickerOptions = pickerOptions
        self.prompt = prompt
        self._selectedOption = selectedOption
        self._showPopup = showPopup
    }

    public var body: some View {
        ZStack {
            VStack {
                // PopUp Window
                VStack(alignment: .center, spacing: 0) {

                    HStack {
                        Spacer()
                        Button("Cancel") {
                            withAnimation {
                                showPopup = false
                            }
                        }.padding()
                    }
                    .background(Color(.darkGray))
                    .foregroundColor(.white)

                    if let prompt {
                        HStack {
                            Text(prompt)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.top)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            Spacer()
                        }
                    }

                    List(selection: $selectedOption) {
                        ForEach(pickerOptions) { option in
                            PopupItem(option: option)
                                .id(option.id)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: pickerAnimationDuration)) {
                                        selectedOption = option
                                        showPopup = false
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    .padding(12)
                }
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .frame(maxWidth: 400, maxHeight: 450)
                .padding(.horizontal, 10)

                Spacer()
            }
        }
        .padding()
    }
}

struct PopupPicker_Previews: PreviewProvider {
    static var previews: some View {
        PickerPopup(pickerOptions: PickerOption.sampleData,
                    prompt: "Select an item from the list",
                    selectedOption: .constant(nil),
                    showPopup: .constant(true))
        PickerPopup(pickerOptions: PickerOption.sampleData,
                    prompt: nil,
                    selectedOption: .constant(nil),
                    showPopup: .constant(true))
    }
}
