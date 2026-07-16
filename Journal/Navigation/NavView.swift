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
                    EmptyView()
                        .searchable(text: $query)
                }
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
