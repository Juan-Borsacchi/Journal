//
//  RegisterPreview.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 24/07/26.
//

import SwiftUI

struct RegisterPreview: View {
    let item: Register

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(item.title)
                    .font(.headline)

                //Spacer()

                if item.favorite == true {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }

                if item.lock == true {
                    Image(systemName: "lock.fill")
                }
            }

            if let subtitle = item.subtitle {
                Text(subtitle)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        //.frame(minWidth: .infinity, minHeight: 300)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
