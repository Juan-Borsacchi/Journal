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
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color(.icons))
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(colorScheme == .light ? Color.white.opacity(0.6) : Color(.systemGray6).opacity(0.5))
                        .overlay(
                            Circle()
                                .stroke(colorScheme == .light ? Color.white.opacity(0.4) : Color.white.opacity(0.15), lineWidth: 1)
                        )
                )
                .shadow(
                    color: colorScheme == .light ? Color.black.opacity(0.08) : Color.black.opacity(0.4),
                    radius: 6, x: 3, y: 4
                )
                .shadow(
                    color: colorScheme == .light ? Color.white.opacity(0.5) : Color.white.opacity(0.05),
                    radius: 4, x: -2, y: -2
                )
        }
    }
}
