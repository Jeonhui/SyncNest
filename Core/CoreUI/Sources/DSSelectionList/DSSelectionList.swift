//
//  DSSelectedList.swift
//  CoreUI
//
//  Created by 이전희 on 4/15/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

public struct DSSelectionList<Element, Content>: View
where Element: Identifiable, Content: View {
    private var data: [Element]
    @Binding private var selection: Element?
    @ViewBuilder private let content: (_ value: Element) -> Content
    
    public init(_ data: [Element],
                selection: Binding<Element?>,
                @ViewBuilder content: @escaping (Element) -> Content) {
        self.data = data
        self._selection = selection
        self.content = content
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                ForEach(data) { value in
                    content(value)
                        .onTapGesture {
                            self.selection = value
                        }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}
