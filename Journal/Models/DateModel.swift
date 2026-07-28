//
//  SwiftUIView.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 20/07/26.
//

import SwiftUI

struct DayHistory: Identifiable {
    let id = UUID()
    let date: Date
    var isFull: Bool = false
    
    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
