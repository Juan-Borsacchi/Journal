//
//  SearchView.swift
//  Journal
//
//  Created by Igor Carrasco on 23/07/26.
//

import SwiftUI

struct SearchView: View {
    @Environment(Router.self) private var router
    @State private var searchText: String = ""
    
    private var allRegisters: [Register] {
        registerTypes
            .flatMap{ $0.listOfRegisters }
            .filter{ $0.title != "Ver todos" }
    }
    
    private var results: [Register] {
        let query = searchText.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else { return allRegisters }
        return allRegisters.filter{ item in
            let inTitle = item.title.localizedCaseInsensitiveContains(query)
            let inSubtitle = item.subtitle?.localizedCaseInsensitiveContains(query) ?? false
            return inTitle || inSubtitle
        }
    }
    
    var body: some View {
        List{
            ForEach(results) { item in
                NavigationLink(value: Route.detail(id: item.id)) {
                    RowContent(item: item)
                }
            }
            .rowBackground()
        }
        .overlay {
            if results.isEmpty {
                ContentUnavailableView.search(text: searchText)
            }
        }
        .navigationTitle("Buscar")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Buscar registros")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Filter", systemImage: "line.3.horizontal.decrease") {
                    
                }
            }
        }
        
        .appBackground()
    }
}

#Preview {
    SearchView()
        .environment(Router())
}
