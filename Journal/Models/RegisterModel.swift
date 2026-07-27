//
//  RegisterModel.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI
//import Combine

struct Register: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    var subtitle: String? = nil
    var lock: Bool? = false
    var favorite: Bool? = false
}

struct RegisterType: Identifiable {
    let id: UUID = UUID()
    let type: String
    let listOfRegisters: [Register]
}

let registerTypes: [RegisterType] = [
    RegisterType(type: "Registros", listOfRegisters: [
        Register(title: "Dia 25 de junho", subtitle: "Hoje eu comi algo muito especial. Preparei arroz, feijão, macarrão e um filé de frango grelhado, além de uma salada bem fresca. Tudo ficou muito saboroso e me lembrou aquelas refeições caseiras que trazem uma sensação de conforto. ", lock: true),
        Register(title: "Dia 24 de junho", subtitle: "Hoje eu bebi...", favorite: true),
        Register(title: "Ver todos")
    ]),
    RegisterType(type: "Rotinas", listOfRegisters: [
        Register(title: "Musculação", subtitle: "Lista de treinos"),
        Register(title: "Ver todos")
    ]),
    RegisterType(type: "Compartilhadas", listOfRegisters: [
        Register(title: "Dia 23 de junho", subtitle: "Hoje fizemos...", lock: true, favorite: true),
        Register(title: "Ver todos")
    ]),
]
