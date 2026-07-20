//
//  ContentView.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 14/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ListOf()
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
