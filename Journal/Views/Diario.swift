//
//  Untitled.swift
//  Journal
//
//  Created by Igor Carrasco on 15/07/26.
//

import SwiftUI

struct DiarioView: View {
    @Environment(Router.self) private var router
    @State private var viewModel = DiaryViewModel()
    
    var body: some View {
        
        VStack {

            DiaryPicker(
                tab: $viewModel.tab
            )
            .padding(.top, 10)
            .padding(.horizontal)
            
            List {
                Section {
                    ForEach(viewModel.diaryFilter) { item in
                        NavigationLink(value: Route.detail(id: item.id)) {
                            RowContent(item: item)
                        }
                    }
                }
                .rowBackground()
            }
        }
        .navigationTitle("Diário")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .secondaryAction){
                DiaryMenu(ordenacaoAtual: $viewModel.ordenacaoAtual, agrupacaoAtual: $viewModel.agrupacaoAtual)
            }
            
            ToolbarItem(placement: .primaryAction){
                Button{
                    router.showNewEntry = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            
        }
        .appBackground()
    }
}

#Preview {
    DiarioView()
        .environment(Router())
}
