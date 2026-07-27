//
//  Untitled.swift
//  Journal
//
//  Created by Igor Carrasco on 23/07/26.
//

import SwiftUI

struct RegisterRow: View {
    @Environment(Router.self) private var  router
    
    let type: RegisterType
    let item: Register
    
    var body: some View {
        if item.title == "Ver todos" {
            Button {
                seeAllDestination()
            } label: {
                RowContent(item: item)
            }
            .buttonStyle(.plain)
        } else {
            NavigationLink(value: Route.detail(id: item.id)) {
                RowContent(item: item)
            }
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
        
        private func seeAllDestination() {
            switch type.type {
            case "Registros":
                router.openDiary(.diary)
            case "Compartilhadas":
                router.openDiary(.shared)
            case "Rotinas":
                router.selectedTab = .rotinas
            default:
                router.selectedTab = .diario
            }
        }
    }
