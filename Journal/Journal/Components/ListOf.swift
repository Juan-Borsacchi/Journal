//
//  ListOf.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

//Colocar essas structures e let como observables
struct Register: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    var subtitle: String? = nil
    var lock: Bool? = false
}

struct RegisterType: Identifiable {
    let id: UUID = UUID()
    let type: String
    let listOfRegisters: [Register]
}

let registerTypes: [RegisterType] = [
    RegisterType(type: "Registros", listOfRegisters: [
        Register(title: "Dia 25 de junho", subtitle: "Hoje eu comi...", lock: true),
        Register(title: "Dia 24 de junho", subtitle: "Hoje eu bebi..."),
        Register(title: "Ver todos")
    ]),
    RegisterType(type: "Rotinas", listOfRegisters: [
        Register(title: "Musculação", subtitle: "Lista de treinos"),
        Register(title: "Ver todos")
    ]),
    RegisterType(type: "Compartilhadas", listOfRegisters: [
        Register(title: "Dia 23 de junho", subtitle: "Hoje fizemos...", lock: true),
        Register(title: "Ver todos")
    ]),
]

struct ListOf: View {
    @State private var singleSelection: UUID?
    
    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                
                Text("Aqui vai o Dashboard")
                
                ForEach(registerTypes) { type in
                    Section(header: Text("\(type.type)").font(.title3).fontWeight(.bold).foregroundStyle(.primary)){
                        ForEach(type.listOfRegisters) { item in
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(item.subtitle == nil ? .body : .headline)
                                Text(item.subtitle ?? "")
                                    .font(.subheadline)
                            }
                            .badge(item.lock == true ? "\(Image(systemName: "lock"))" : "")
                            .badge(item.subtitle == nil ? "\(Image(systemName: "chevron.right"))" : "")
                        }
                    }
                }
            }
            .navigationTitle("Seus Registros")
        }
    }
}

#Preview {
    ListOf()
}
