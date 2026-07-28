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
        
    var pendingDiaryCategory: TypeDiary?
    
    func openDiary(_ category: TypeDiary) {
        diarioPath.removeAll()
        pendingDiaryCategory = category
        selectedTab = .diario
    }
    
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
    
    func push(_ route: Route, on tab: AppTab) {
        switch tab {
        case .inicio:
            inicioPath.append(route)
        case .diario:
            diarioPath.append(route)
        case .rotinas:
            rotinasPath.append(route)
        case .search:
            inicioPath.append(route)
        }
    }
}
