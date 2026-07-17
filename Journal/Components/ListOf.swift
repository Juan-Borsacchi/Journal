//
//  ListOf.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

struct ListOf: View {
    var body: some View {
        List {
            
            Text("Aqui vai o Dashboard")
            
            ForEach(registerTypes) { type in
                Section(header: Text(type.type)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                ){
                    ForEach(type.listOfRegisters) { item in
                        if item.subtitle == nil {
                            Button {
                                // Navegar para a lista completa de registros
                            } label: {
                                rowContent(item)
                            }
                            .buttonStyle(.plain)
                        } else {
                            NavigationLink(value: Route.detail(id: item.id)) {
                                rowContent(item)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Seus Registros")
    }
    
    @ViewBuilder
    private func rowContent(_ item: Register) -> some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(item.subtitle == nil ? .body : .headline)
            if let subtitle = item.subtitle {
                Text(subtitle)
                    .font(.subheadline)
            }
        }
        .badge(item.lock == true ? "\(Image(systemName: "lock"))" : "")
        .badge(item.subtitle == nil ? "\(Image(systemName: "chevron.right"))" : "")    }
}

#Preview {
    NavigationStack {
        ListOf()
    }
    .environment(Router())
}
