//
//  DiaryModel.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI

@Observable
final class DiaryViewModel {

    var tab: TypeDiary = .diary
    var currentOrder = "Padrão (Data de Edição)"
    var currentGroup = "Padrão (Ativado)"

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
