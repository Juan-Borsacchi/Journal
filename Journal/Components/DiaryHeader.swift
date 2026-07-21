//
//  EditMenu.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI

struct DiaryHeader: View {

    @Binding var ordenacaoAtual: String

    var body: some View {

        HStack {

            Text("Seus Registros")
                .font(.title2) .bold()

            Spacer()

            DiaryMenu(
                ordenacaoAtual: $ordenacaoAtual
            )
        }
        .padding([.horizontal, .top])
    }
}
