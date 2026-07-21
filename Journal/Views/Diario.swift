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
            VStack{
                DiaryHeader(
                    ordenacaoAtual: $viewModel.ordenacaoAtual
                )
                
                DiaryPicker(
                    tab: $viewModel.tab
                )
            }
            .padding(.bottom)
            List {
                Section {
                    ForEach(viewModel.diaryFilter) { item in
                        NavigationLink(value: Route.detail(id: item.id)) {
                            RowContent(item: item)
                        }
                    }
                }
            }
            .rowBackground()
            .listStyle(.plain)
            .headerProminence(.increased)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding()
        .appBackground()
    }
}

#Preview {
    DiarioView()
}
