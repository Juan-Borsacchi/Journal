//
//  ListOf.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

struct ListOf: View {
    @Environment(Router.self) private var router
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        List {
            
            Section(header: sectionHeader("Sequência de registros")) {
                    Carousel()
                        .listRowInsets(EdgeInsets())
                }
            
            ForEach(registerTypes) { type in
                Section(header: sectionHeader(type.type)){
                    ForEach(type.listOfRegisters) { item in
                        RegisterRow(type: type, item: item)
                    }
                }
            }
            .rowBackground()
        }
        .navigationTitle("Seus Registros")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    router.showNewEntry = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            ToolbarItem(placement: .topBarTrailing){
                Image(systemName: "ellipsis")
            }
        }
        
        .appBackground()
        
    }
    
    private func sectionHeader(_ text: String) -> some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color.primary)
    }
}

#Preview {
    NavigationStack {
        ListOf()
    }
    .environment(Router())
}
