//
//  Carousel.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

struct Carousel: View {
    
    @State private var estaSubindo = false
    
    var body: some View {
        VStack {
            Text("Carousel")
            Image("book.closed.fire")
                .renderingMode(.original)
                .font(.system(size: 60))
                .offset(y: estaSubindo ? -12 : 0)
                .animation(
                    .easeInOut(duration: 1.8)
                    .repeatForever(autoreverses: true),
                    value: estaSubindo
                )
        }
        .onAppear {
            estaSubindo = true
        }
    }
}

#Preview {
    Carousel()
}
