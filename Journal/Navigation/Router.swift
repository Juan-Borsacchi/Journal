//
//  NavModel.swift
//  Journal
//
//  Created by Igor Carrasco on 16/07/26.
//

import SwiftUI

enum AppTab: Hashable {
    case inicio, diario, rotinas, search
}

enum Route: Hashable {
    case detail(id: UUID)
    case newEntry
}

@Observable
final class Router {
    var selectedTab: AppTab = .inicio
    
    var inicioPath: [Route] = []
    var diarioPath: [Route] = []
    var rotinasPath: [Route] = []
    
    func popToRoot(_ tab: AppTab) {
        switch tab {
        case .inicio:
            inicioPath.removeAll()
        case .diario:
            diarioPath.removeAll()
        case .rotinas:
            rotinasPath.removeAll()
        case .search:
            break
        }
    }
    
//    var path: [Route] = []
//    
//    func push(_ route: Route) {
//        path.append(route)
//    }
//    
//    func pop() {
//        if !path.isEmpty {
//            path.removeLast()
//        }
//    }
//    
//    func popToRoot() {
//        path.removeAll()
//    } // ex: depois de salvar a entrada
}
