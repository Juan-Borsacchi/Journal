//
//  RowContent.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 20/07/26.
//

import SwiftUI

struct RowContent: View {
    let item: Register
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(item.subtitle == nil ? .body : .subheadline)
                .fontWeight(item.subtitle == nil ? .regular : .bold)
            if let subtitle = item.subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .opacity(0.5)
            }
        }
        .badge(item.lock == true ? "\(Image(systemName: "lock"))" : "")
        .badge(item.subtitle == nil ? "\(Image(systemName: "chevron.right"))" : "")
        .contextMenu {
            
            Button("Favoritar", systemImage: "star") {}
            Button("Compartilhar", systemImage: "square.and.arrow.up") {}
            Button(role: .destructive) {} label: { Label("Excluir", systemImage: "trash") }
            
            Divider()
            
            Button("Mover para Rotina", systemImage: "folder") {}
                Button("Bloquear Registro", systemImage: "lock") {}
                Button("Copiar Registro", systemImage: "doc.on.doc") {}
            } preview: {
                RegisterPreview(item: item)
            }
        
    }
}
