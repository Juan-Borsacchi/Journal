//
//  ColorModel.swift
//  Journal
//
//  Created by Igor Carrasco on 17/07/26.
//

import SwiftUI

extension Color {
    static let appBackground = Color.cardBackground
}

struct AppBackGround: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .background(Color.appBackground.ignoresSafeArea())
    }
}

extension View {
    func appBackground() -> some View {
        modifier(AppBackGround())
    }
}
