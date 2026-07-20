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
            
            Tab(value: AppTab.inicio) {
                NavigationStack(path: $router.inicioPath) {
                    InicioView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Início", "house", for: .inicio)
            }
            
            Tab(value: AppTab.diario) {
                NavigationStack(path: $router.diarioPath) {
                    DiarioView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Diário", "book.pages", for: .diario)
            }
            
            Tab(value: AppTab.rotinas) {
                NavigationStack(path: $router.diarioPath) {
                    RotinasView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Rotinas", "square.stack.3d.up", for: .rotinas)
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
    
    private func tablabel(_ title: String, _ symbol: String, for tab: AppTab) -> some View {
        Label(title, systemImage: symbol)
            .environment(\.symbolVariants, router.selectedTab == tab ? .fill : .none)
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
