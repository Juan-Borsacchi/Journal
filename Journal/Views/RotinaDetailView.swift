//
//  RotinaDetailView.swift
//  Journal
//
//  Created by Igor Carrasco on 16/07/26.
//

import SwiftUI

struct RotinaDetailView: View {
    let id: UUID
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Rotina id: \(id)")
                .font(.title)
            Text("Conteúdo da entrada #\(id)")
                .foregroundStyle(.secondary)
        }
        .navigationTitle("Entrada \(id)")
    }
}

#Preview {
    RotinaDetailView(id: UUID())
}
