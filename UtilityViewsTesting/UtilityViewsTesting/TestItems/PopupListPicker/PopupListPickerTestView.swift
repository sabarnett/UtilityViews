//
// File: PopupListPickerTestView.swift
// Package: UtilityViewsTesting
// Created by: Steven Barnett on 16/03/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI
import UtilityViews

struct PopupListPickerTestView: View {
    
    @State private var showPicker1: Bool = false
    @State private var selectedPerson: PickerOption?
    
    var currentPilot: PickerOption {
        if let selectedPerson { return selectedPerson }
        return PickerOption.sampleData[0]
    }
    
    var personList: [PickerOption] {
        
        let result = Range(1...5).map({ ix in
            return PickerOption(image: UIImage(named: "Person_\(ix).jpg"),
                                title: "Person \(ix)",
                                subTitle: "This is person \(ix)")
        })
        
        return result
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Text("Tap the current item to select a person.")
                
                PickerPopupButton(selectedItem: currentPilot,
                                  showPicker: $showPicker1)
                .padding()
                
                if let selectedPerson {
                    VStack(spacing: 10) {
                        Image(uiImage: selectedPerson.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                        Text(selectedPerson.title).font(.title)
                        Text(selectedPerson.subTitle).font(.body)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Popup List Picker")
            .blur(radius: showPicker1 ? 8 : 0)
            
            if showPicker1 {
                PickerPopup(pickerOptions: personList,
                            prompt: "Select a person from the list",
                            selectedOption: $selectedPerson,
                            showPopup: $showPicker1
                )
            }
        }
    }
}

struct PopupListPickerTestView_Previews: PreviewProvider {
    static var previews: some View {
        PopupListPickerTestView()
    }
}
