//
//  NavView.swift
//  Journal
//
//  Created by Igor Carrasco on 15/07/26.
//

import SwiftUI

struct NavView: View {
    @Environment(Router.self) private var router
    @State private var query: String = ""

    var body: some View {
        @Bindable var router = router

        TabView(selection: $router.selectedTab) {

            Tab("Novo", systemImage: "plus.circle.fill", value: AppTab.newEntry) {
                EmptyView()
            }
            
            Tab("Inicio", systemImage: "house.fill", value: AppTab.inicio) {
                NavigationStack(path: $router.inicioPath) {
                    InicioView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            }

            Tab("Diario", systemImage: "person.fill", value: AppTab.diario) {
                NavigationStack(path: $router.diarioPath) {
                    DiarioView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            }

            Tab("Rotinas", systemImage: "cloud.fill", value: AppTab.rotinas) {
                NavigationStack(path: $router.rotinasPath) {
                    RotinasView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            }

            Tab(value: AppTab.search, role: .search) {
                NavigationStack {
                    ContentUnavailableView("Buscar", systemImage: "magnifyingglass", description: Text("O que você procura?"))
                        .appBackground()
                        .searchable(text: $query)
                }
            }
        }
        .onChange(of: router.selectedTab) { oldTab, newTab in
            if newTab == .newEntry {
                router.selectedTab = oldTab
                router.showNewEntry = true
            }
        }
        .fullScreenCover(isPresented: $router.showNewEntry) {
            NavigationStack {
                NewRegisterView()
            }
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .detail(let id):
            RotinaDetailView(id: id)
        case .newEntry:
            NewRegisterView()
        }
    }
}


#Preview {
    NavView()
        .environment(Router())
}
