//
//  NavView.swift
//  Journal
//
//  Created by Igor Carrasco on 15/07/26.
//

import SwiftUI

struct NavView: View {
    @State private var selectedTab: Int = 0
    
    @State private var query: String = ""
    
    var body: some View {
        HStack {
            
            TabView {
                
                Tab("Inicio", systemImage: "house.fill") {
                    InicioView()
                }

                Tab("Diario", systemImage: "person.fill") {
                    DiarioView()
                }
                
                Tab("Rotinas", systemImage: "cloud.fill") {
                    RotinasView()
                }

                Tab(role: .search) {
                    NavigationStack {
                        EmptyView()
                            .searchable(text: $query)
                    }
                }
            }
        }
    }
}

#Preview {
    NavView()
}
