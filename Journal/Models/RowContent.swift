//
//  RowContent.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 20/07/26.
//

import SwiftUI

struct RowContent: View {
    let item: Register
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(item.subtitle == nil ? .body : .headline)
            if let subtitle = item.subtitle {
                Text(subtitle)
                    .font(.subheadline)
            }
        }
        .badge(item.lock == true ? "\(Image(systemName: "lock"))" : "")
        .badge(item.subtitle == nil ? "\(Image(systemName: "chevron.right"))" : "")    }
}
