//
// File: PickerOption.swift
// Package: UtilityViews
// Created by: Steven Barnett on 17/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 Defines the content to be displayed for each individual item in the picker
 
 Each item will have a unique id assigned by default. You are expected to set the image, title and subtitle.
 */
open class PickerOption: Identifiable, Hashable {

    // Hashable
    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

    // Equatable
    public static func == (lhs: PickerOption, rhs: PickerOption) -> Bool {
        lhs.id == rhs.id
    }

    public var id: UUID = UUID()

    public var image: UIImage?
    public var title: String
    public var subTitle: String
    
    /// Defines the attributes of an item in the picker. This defines the three items we need in order to display
    /// an item, the title text, a sub-title and an image.
    ///
    /// - Parameters:
    ///   - image: The image to display in th epicker line
    ///   - title: The title of the item
    ///   - subTitle: A sub-title for the item to give additional context.
    public init(image: UIImage? = nil, title: String, subTitle: String) {
        self.id = UUID()
        self.image = image
        self.title = title
        self.subTitle = subTitle
    }
}

extension PickerOption {
    /// Sample data containing four sample picker options
    public static var sampleData: [PickerOption] { [
        PickerOption(image: UIImage(systemName: "paperplane.circle"),
                     title: "Title Text 1",
                     subTitle: "Sub-title text below title"),
        PickerOption(image: UIImage(systemName: "checkmark.square.fill"),
                     title: "Title Item 2",
                     subTitle: "Sub-title text for title 2"),
        PickerOption(image: nil,
                     title: "Title Item No Image",
                     subTitle: "Sub-title for an item with no image"),
        PickerOption(image: UIImage(systemName: "paperplane.circle.fill"),
                     title: "Title of item 3",
                     subTitle: "Sub-title shown below item 3"),
        PickerOption(image: UIImage(systemName: "heart.fill"),
                     title: "Title number 4",
                     subTitle: "Sub-title 4")
    ]}
}
