//
// File: PopupItem.swift
// Package: UtilityViews
// Created by: Steven Barnett on 17/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 Defines the layout of an individual picker option.
 */
public struct PopupItem: View {

    private let imageWidth: CGFloat = 60
    private let imageHeight: CGFloat = 60

    /// The content to be displayed. This is a PickerOption containing an UIImage,
    /// Title and Sub-Title
    public var option: PickerOption

    public init(option: PickerOption) {
        self.option = option
    }

    public var body: some View {
        HStack {
            if let image = option.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.secondary.opacity(0.2))
                    Image(systemName: "photo")
                        .scaleEffect(1.3)
                        .foregroundColor(.secondary.opacity(0.5))
                }
                .frame(width: imageWidth, height: imageHeight)
            }
            VStack(alignment: .leading) {
                Text(option.title).font(.title3)
                Text(option.subTitle).font(.caption)
            }
        }
    }
}
