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
