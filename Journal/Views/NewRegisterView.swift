//
//  NewRegisterView.swift
//  Journal
//
//  Created by Igor Carrasco on 16/07/26.
//

import SwiftUI

struct NewRegisterView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var body_: String = ""
    
    var body: some View {
            VStack (alignment: .leading, spacing: 8) {
//                TextField("Título", text: $title)
//                    .font(.title.bold())
//                    .textInputAutocapitalization(.sentences)
                Divider()
                TextEditor(text: $body_)
                    .font(.body)
                    .frame(minHeight: 300)
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
        .navigationTitle("Novo Registro")
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
            
            
            /*ToolbarItem(placement: .cancellationAction) {
                Button("Cancelar", systemImage: "chevron.left") {
                    dismiss()
                }
            }*/
            
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
                    // A FAZER: Salvar a nota
                    dismiss()
                }
                .disabled(title.isEmpty && body_.isEmpty)
                .tint(.action)
            }
        }
        .appBackground()
    }
}

#Preview {
    NewRegisterView()
}
