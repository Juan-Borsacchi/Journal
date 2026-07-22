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
            
            Section(header: Text("Sequência de Registros")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.primary)) {
                    Carousel()
                        .listRowInsets(EdgeInsets())
                }
            
            ForEach(registerTypes) { type in
                Section(header: Text(type.type)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                ){
                    ForEach(type.listOfRegisters) { item in
                        if item.subtitle == nil {
                            Button {
                                router.selectedTab = .diario
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
}

#Preview {
    NavigationStack {
        ListOf()
    }
    .environment(Router())
}
