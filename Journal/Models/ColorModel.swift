//
//  ColorModel.swift
//  Journal
//
//  Created by Igor Carrasco on 17/07/26.
//

import SwiftUI

extension Color {
    static let appBackground = Color.backGround
    static let appRow = Color.cardBackground
    static let appAccent = Color.action
}

struct AppRowBackGround: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.appRow)
    }
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
    
    func rowBackground() -> some View {
        modifier(AppRowBackGround())
    }
}
