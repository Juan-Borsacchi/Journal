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
            
            Tab(value: AppTab.home) {
                NavigationStack(path: $router.homePath) {
                    HomeView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Início", "house", for: .home)
            }
            
            Tab(value: AppTab.diary) {
                NavigationStack(path: $router.diaryPath) {
                    DiaryView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Diário", "book.pages", for: .diary)
            }
            
            Tab(value: AppTab.routine) {
                NavigationStack(path: $router.routinePath) {
                    RoutineView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            } label: {
                tablabel("Rotinas", "square.stack.3d.up", for: .routine)
            }

            Tab(value: AppTab.search, role: .search) {
                NavigationStack {
                    SearchView()
                        .navigationDestination(for: Route.self, destination: destination)
                }
            }
        }
        .tint(.icons)
    }
    
    private func tablabel(_ title: String, _ symbol: String, for tab: AppTab) -> some View {
        Label(title, systemImage: symbol)
            .environment(\.symbolVariants, router.selectedTab == tab ? .fill : .none)
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .detail(let id):
            NewRegisterView(id: id)
        case .newEntry:
            NewRegisterView()
        }
    }
}


#Preview {
    NavView()
        .environment(Router())
}
