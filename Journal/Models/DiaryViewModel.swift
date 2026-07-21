//
//  DiaryModel.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI
import Combine

final class DiaryViewModel: ObservableObject {

    @Published var tab: TypeDiary = .diary
    @Published var ordenacaoAtual = "Padrão (Data de Edição)"

    var diaryFilter: [Register] {

        switch tab {

        case .diary:
            return registerTypes
                .filter { $0.type != "Rotinas" }
                .flatMap { $0.listOfRegisters }
                .filter { $0.title != "Ver todos" }

        case .shared:
            return registerTypes
                .filter { $0.type == "Compartilhadas" }
                .flatMap { $0.listOfRegisters }
                .filter { $0.title != "Ver todos" }

        case .favorites:
            return registerTypes
                .flatMap { $0.listOfRegisters }
                .filter { $0.favorite == true}
        }
    }
}
