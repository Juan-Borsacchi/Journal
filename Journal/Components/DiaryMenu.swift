//
//  EditMenu.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

//import SwiftUI
//
//struct DiaryMenu: View {
//    
//    @Environment(\.colorScheme) private var colorScheme
//    @Binding var ordenacaoAtual: String
//    @Binding var agrupacaoAtual: String
//    
//    var body: some View {
//        Menu {
//            Button(action: {
//                print("Galeria")
//            }) {
//                Label("Ver como Galeria", systemImage: "square.grid.2x2")
//            }
//            Divider()
//            
//            Button(action: {
//                print("Selecionar")
//            }) {
//                Label("Selecionar Registros", systemImage: "checkmark.circle")
//            }
//            
//            Menu {
//                Button(action: { ordenacaoAtual = "Padrão (Data de Edição)" }) {
//                    HStack {
//                        Text("Padrão (Data de Edição)")
//                    }
//                }
//                Button(action: { ordenacaoAtual = "Data de Edição" }) {
//                    HStack {
//                        Text("Data de Edição")
//                    }
//                }
//                Button(action: { ordenacaoAtual = "Data de Criação" }) {
//                    HStack {
//                        Text("Data de Criação")
//                    }
//                }
//                Button(action: { ordenacaoAtual = "Título" }) {
//                    HStack {
//                        Text("Título")
//                    }
//                }
//                Divider()
//                Button(action: { ordenacaoAtual = "Mais Recente Primeiro" }) {
//                    HStack {
//                        Text("Mais Recente Primeiro")
//                    }
//                }
//                Button(action: { ordenacaoAtual = "Mais Antiga Primeiro" }) {
//                    HStack{
//                        Text("Mais Antiga Primeiro")
//                    }
//                }
//            } label: {
//                Text("Ordenar por")
//                Text(ordenacaoAtual)
//                Image(systemName: "arrow.up.arrow.down")
//            }
//            
//            Menu {
//                Button(action: { agrupacaoAtual = "Padrão (Ativado)" }) {
//                    HStack {
//                        Text("Padrão (Ativado)")
//                    }
//                }
//                Button(action: { agrupacaoAtual = "Ativado" }) {
//                    HStack {
//                        Text("Ativado")
//                    }
//                }
//                Button(action: { agrupacaoAtual = "Desativado" }) {
//                    HStack {
//                        Text("Desativado")
//                    }
//                }
//            } label: {
//                Text("Agrupar por Data")
//                Text(agrupacaoAtual)
//                Image(systemName: "calendar")
//            }
//        }
//        label: {
//            Image(systemName: "ellipsis")
//        }
//    }
//}
import SwiftUI

struct DiaryMenu: View {

    @Environment(\.colorScheme) private var colorScheme
    @Binding var ordenacaoAtual: String
    @Binding var agrupacaoAtual: String

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

            // ORDENAR POR — Picker com Sections = check automático + divisória
            Menu {
                Picker("Ordenar por", selection: $ordenacaoAtual) {
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
                Text(ordenacaoAtual)
                Image(systemName: "arrow.up.arrow.down")
            }

            // AGRUPAR POR DATA
            Menu {
                Picker("Agrupar por Data", selection: $agrupacaoAtual) {
                    Text("Padrão (Ativado)").tag("Padrão (Ativado)")
                    Text("Ativado").tag("Ativado")
                    Text("Desativado").tag("Desativado")
                }
            } label: {
                Text("Agrupar por Data")
                Text(agrupacaoAtual)
                Image(systemName: "calendar")
            }
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
