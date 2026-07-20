//
//  SwiftUIView.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 20/07/26.
//

import SwiftUI

struct DiaHistorico: Identifiable {
    let id = UUID()
    let data: Date
    var estaPreenchido: Bool = false
    
    var numeroDia: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: data)
    }
}
