//
//  EditMenu.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI

struct DiaryMenu: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Binding var ordenacaoAtual: String
    
    var body: some View {
        Menu {
            Button(action: {
                print("Galeria")
            }) {
                Label("Ver como Galeria", systemImage: "square.grid.2x2")
            }
            Divider()
            
            Button(action: {
                print("Selecionar")
            }) {
                Label("Selecionar Registros", systemImage: "checkmark.circle")
            }
            
            Menu {
                Button(action: { ordenacaoAtual = "Padrão (Data de Edição)" }) {
                    HStack {
                        Text("Padrão (Data de Edição)")
                    }
                }
                Button(action: { ordenacaoAtual = "Data de Edição" }) {
                    HStack {
                        Text("Data de Edição")
                    }
                }
                Button(action: { ordenacaoAtual = "Data de Criação" }) {
                    HStack {
                        Text("Data de Criação")
                    }
                }
                Button(action: { ordenacaoAtual = "Título" }) {
                    HStack {
                        Text("Título")
                    }
                }
                Divider()
                Button(action: { ordenacaoAtual = "Mais Recente Primeiro" }) {
                    HStack {
                        Text("Mais Recente Primeiro")
                    }
                }
                Button(action: { ordenacaoAtual = "Mais Antiga Primeiro" }) {
                    HStack{
                        Text("Mais Antiga Primeiro")
                    }
                }
            } label: {
                Text("Ordenar por")
                Text(ordenacaoAtual)
                Image(systemName: "arrow.up.arrow.down")
            }
            
            Button(role: .destructive, action: {
                print("Apagar pressionado")
            }) {
                Label("Excluir", systemImage: "trash")
            }
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
