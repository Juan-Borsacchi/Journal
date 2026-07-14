//
//  ListOf.swift
//  Journal
//
//  Created by Igor Carrasco on 14/07/26.
//

import SwiftUI

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
