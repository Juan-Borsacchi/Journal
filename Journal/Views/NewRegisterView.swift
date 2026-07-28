//
//  NewRegisterView.swift
//  Journal
//
//  Created by Igor Carrasco on 16/07/26.
//

import SwiftUI

struct NewRegisterView: View {
    let id: UUID?
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var body_: String = ""
    @State private var showAttachments: Bool = false
    
    init(id: UUID? = nil) {
        self.id = id
    }
    
    private var isEditing: Bool {
        id != nil
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            
            Divider()
            
            TextEditor(text: $body_)
                .font(.body)
                .frame(maxHeight: .infinity)
                .scrollContentBackground(.hidden)
                .overlay(alignment: .topLeading) {
                    if body_.isEmpty {
                        Text("Como foi o seu dia?")
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                            .allowsHitTesting(false)
                    }
                }
        }
        .padding()
        .navigationTitle(title.isEmpty ? "Novo Registro" : title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Menu {
                    Section("Estilo") {
                        Button("Título") { }
                        Button("Cabeçalho") { }
                        Button("Corpo") { }
                    }
                    
                    Divider()
                    
                    Section("Formatação") {
                        Button("Negrito", systemImage: "bold") { }
                        Button("Itálico", systemImage: "italic") { }
                        Button("Sublinhado", systemImage: "underline") { }
                        Button("Tachado", systemImage: "strikethrough") { }
                    }
                    
                    Divider()
                    
                    Section("Alinhamento") {
                        Button("Esquerda") { }
                        Button("Centralizado") { }
                        Button("Direita") { }
                    }
                } label: {
                    Text("Aa")
                }
                
                Button {
                    showAttachments = true
                } label: {
                    Image(systemName: "paperclip")
                }
                .confirmationDialog("Adicionar", isPresented: $showAttachments) {
                    Button("Foto") { }
                    Button("Documento") { }
                    Button("Link") { }
                    Button("Escanear Documento") { }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "checklist")
                }
                
                Menu {
                    Button("Lista com marcadores", systemImage: "list.triangle") {}
                    
                    Button("Lista numerada", systemImage: "list.number") {}
                    
                    Button("Lista tracejada", systemImage: "list.dash") {}
                    
                } label: {
                    Image(systemName: "list.bullet")
                }
                Spacer()
            }
            
            ToolbarItem{
                Button("Compartilhar", systemImage: "square.and.arrow.up") {
                    
                }
            }
            
            ToolbarItem{
                Button("...", systemImage: "ellipsis") {
                    
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Salvar", systemImage: "checkmark") {
                    dismiss()
                }
                .disabled(title.isEmpty && body_.isEmpty)
                .tint(.action)
            }
        }
        .onAppear(perform: load)
        .appBackground()
    }
    
    private var navTitle: String {
        if isEditing {
            return title.isEmpty ? "Registro" : title
        } else {
            return "Novo registro"
        }
    }
    
    private func load() {
        guard let id, let register = Register.find(by: id) else { return }
        title = register.title
        body_ = register.subtitle ?? ""
    }
}

extension Register {
    static func find(by id: UUID) -> Register? {
        registerTypes
            .flatMap { $0.listOfRegisters }
            .first { $0.id == id }
    }
}

#Preview {
    NewRegisterView()
}
