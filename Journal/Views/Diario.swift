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
            .animation(.snappy, value: viewModel.tab)
        }
        .navigationTitle("Diário")
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
                DiaryMenu(ordenacaoAtual: $viewModel.ordenacaoAtual, agrupacaoAtual: $viewModel.agrupacaoAtual)
            }
            
        }
        .appBackground()
    }
}

#Preview {
    DiarioView()
        .environment(Router())
}
