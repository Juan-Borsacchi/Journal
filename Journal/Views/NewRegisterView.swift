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
                    Button {
                    } label: {
                        Image(systemName: "bold")
                    }
                    
                    Button {
                    } label: {
                        Image(systemName: "italic")
                    }
                    
                    Button {
                    } label: {
                        Image(systemName: "underline")
                    }
                    Spacer()
                }
                
                ToolbarItem{
                    Button("Compartilhar", systemImage: "square.and.arrow.up") {
                        // Ação de compartilhar
                    }
                }
                
                ToolbarItem{
                    Button("...", systemImage: "ellipsis") {
                        //Ação de mais opções
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar", systemImage: "checkmark") {
                        // A FAZER: Salvar a nota
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
