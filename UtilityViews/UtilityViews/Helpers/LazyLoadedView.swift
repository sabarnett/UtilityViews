//
// File: LazyLoadedView.swift
// Package: UtilityViews
// Created by: Steven Barnett on 30/01/2023
// 
// Copyright © 2023 Steven Barnett. All rights reserved.
//

import SwiftUI

/**
 The problem; when you define a view as a target for a NavigationLink in a list that passes in a view
 model, the view model will be instantiated as each list item is created. So, assuming you have
 200 items in your list, you will get 200 view models created when the list is built. That's a performance
 problem that we can address with this view.
 
 LazyLoadedView solves this issue by wrapping the target of the NavigationLink. Because the target is defined in
 a closure, the target view will not be instantiated immediately, but will be created when the link is tapped in.
 
 When the list item
 is rendered, the helper view will be created. The closure will not execute until the link is activated.
 This way, the target destination view and view model, will only be created when the link is tapped. It may
 take slightly longer for the destination to appear, as it will need to be created when the link is tapped,
 but it will be considerably less resource hungry.

 Usage scenario:

````
    NavigationLink(destination: LazyLoadedView {
                DetailView(viewModel: DestinationViewModel())
        })
    {
      Text("Link label")
    }
````

 */
public struct LazyLoadedView<Content: View>: View {
    var content: () -> Content

    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        self.content()
    }
}
