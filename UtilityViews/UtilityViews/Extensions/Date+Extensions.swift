//
// File: Date+Extensions.swift
// Package: UtilityViews
// Created by: Steven Barnett on 21/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import Foundation

extension Date {

    var appDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"

        return formatter.string(from: self)
    }

    var appDateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy - HH:mm"

        return formatter.string(from: self)
    }
}
