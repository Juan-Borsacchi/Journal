//
//  Untitled.swift
//  Journal
//
//  Created by Igor Carrasco on 15/07/26.
//

import SwiftUI

struct DiarioView: View {
    
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
        .navigationTitle("Seu Diário")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .primaryAction){
                DiaryMenu(ordenacaoAtual: $viewModel.ordenacaoAtual)
            }
        }
        .appBackground()
    }
}

#Preview {
    DiarioView()
        .environment(Router())
}
