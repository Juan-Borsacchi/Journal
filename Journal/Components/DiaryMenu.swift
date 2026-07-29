//
//  EditMenu.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI

struct DiaryMenu: View {

    @Environment(\.colorScheme) private var colorScheme
    @Binding var currentOrder: String
    @Binding var currentGroup: String

    var body: some View {
        Menu {
            Button {
                print("Galeria")
            } label: {
                Label("Ver como Galeria", systemImage: "square.grid.2x2")
            }

            Divider()

            Button {
                print("Selecionar")
            } label: {
                Label("Selecionar Registros", systemImage: "checkmark.circle")
            }

            Menu {
                Picker("Ordenar por", selection: $currentOrder) {
                    Section {
                        Text("Padrão (Data de Edição)").tag("Padrão (Data de Edição)")
                        Text("Data de Edição").tag("Data de Edição")
                        Text("Data de Criação").tag("Data de Criação")
                        Text("Título").tag("Título")
                    }
                    Section {
                        Text("Mais Recente Primeiro").tag("Mais Recente Primeiro")
                        Text("Mais Antiga Primeiro").tag("Mais Antiga Primeiro")
                    }
                }
            } label: {
                Text("Ordenar por")
                Text(currentOrder)
                Image(systemName: "arrow.up.arrow.down")
            }

            Menu {
                Picker("Agrupar por Data", selection: $currentGroup) {
                    Text("Padrão (Ativado)").tag("Padrão (Ativado)")
                    Text("Ativado").tag("Ativado")
                    Text("Desativado").tag("Desativado")
                }
            } label: {
                Text("Agrupar por Data")
                Text(currentGroup)
                Image(systemName: "calendar")
            }
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
