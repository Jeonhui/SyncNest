//
//  DSSizeReader.swift
//  CoreUI
//
//  Created by 이전희 on 4/14/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

public extension View {
    func onSizeChange(in coordinateSpace: CoordinateSpace = .global,
                      _ perform: @escaping (CGSize) -> Void) -> some View {
        SizeReader(in: coordinateSpace) { size in
            self
                .onAppear { perform(size) }
                .onChange(of: size) { _, newValue in perform(newValue) }
        }
    }
}

public struct SizeReader<Content>: View where Content: View {
    @ViewBuilder private var content: (_ size: CGSize) -> Content
    @State private var size: CGSize = .zero
    private let coordinateSpace: CoordinateSpace
    
    init(in coordinateSpace: CoordinateSpace = .global,
         @ViewBuilder content: @escaping (_ size: CGSize) -> Content) {
        self.coordinateSpace = coordinateSpace
        self.content = content
    }
    
    public var body: some View {
        content(size)
            .background(
                GeometryReader { reader in
                    Color.clear
                        .onAppear(perform: {
                            let newSize = reader.frame(in: coordinateSpace).size
                            if size != newSize {
                                size = newSize
                            }
                        })
                        .onChange(of: reader.frame(in: coordinateSpace), { _, newValue in
                            guard size != newValue.size else { return }
                            self.size = newValue.size
                        })
                }
            )
    }
}
