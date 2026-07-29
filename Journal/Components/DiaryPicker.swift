//
//  EditMenu.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 21/07/26.
//

import SwiftUI
import Combine

struct DiaryPicker: View {

    @Binding var tab: TypeDiary

    var body: some View {

        Picker("Diary", selection: $tab) {

            Text("Seu Diário").tag(TypeDiary.diary)
            Text("Compartilhados").tag(TypeDiary.shared)
            Text("Favoritos").tag(TypeDiary.favorites)

        }
        .pickerStyle(.palette)
    }
}
