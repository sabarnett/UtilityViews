//
// File: SegmentedView.swift
// Package: Tester
// Created by: Steven Barnett on 13/05/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

public enum SegmentedViewStyle {
    case pill
    case underline
}

public struct SegmentedView: View {
    private var segments: [String]
    private var showBackground: Bool
    private var segmentStyle: SegmentedViewStyle
    private var underlineColor: Color
    private var underlineTextColor: Color

    @Binding public var selected: String

    @Namespace var name

    public init(
        segments: [String],
        showBackground: Bool = true,
        segmentStyle: SegmentedViewStyle = .pill,
        underlineColor: Color = Color(.systemGreen),
        underlineTextColor: Color = Color(.systemGreen),
        selected: Binding<String>) {

        self.segments = segments
        self.showBackground = showBackground
        self.segmentStyle = segmentStyle
        self.underlineColor = underlineColor
        self.underlineTextColor = underlineTextColor

        self._selected = selected
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(segments, id: \.self) { segment in
                    Button(action: {
                        withAnimation {
                            selected = segment
                        }
                    }, label: {
                        switch segmentStyle {
                        case .pill:
                            pillSegmentLabel(segment)
                                .padding(.vertical, 2)
                        case .underline:
                            segmentLabel(segment)
                                .padding(.vertical, 2)
                        }
                    })
                }
            }
            .padding(4)
            .background(showBackground
                ? Color(.systemGray5)
                : Color.clear
            )
        }
    }

    fileprivate func pillSegmentLabel(_ segment: String) -> some View {
            Text(segment)
                .fontWeight(.medium)
                .foregroundColor(selected == segment
                                 ? .primary
                                 : .secondary)
                .padding(.horizontal, selected == segment
                    ? 30
                    : 10)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(selected == segment
                              ? Color(.systemGray2)
                              : Color.clear)
                )
    }

    fileprivate func segmentLabel(_ segment: String) -> some View {
        HStack(alignment: .top) {
            VStack {
                Text(segment)
                    .fontWeight(.medium)
                    .foregroundColor(selected == segment ? underlineTextColor : Color(.systemGray))
                    .padding(.bottom, 0)
                    .padding(.horizontal, 15)

                if selected == segment {
                    Capsule()
                        .fill(underlineColor)
                        .padding(0)
                        .frame(height: 4)
                        .matchedGeometryEffect(id: "Tab", in: name)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .padding(0)
                        .frame(height: 4)
                }
            }
        }
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView(segments: [
            "Item1", "Item2", "Item3", "Item4", "Item5",
            "Item6", "Item7"
        ], selected: .constant("Item3"))
    }
}
