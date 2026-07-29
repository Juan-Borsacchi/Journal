//
//  NavModel.swift
//  Journal
//
//  Created by Igor Carrasco on 16/07/26.
//

import SwiftUI

enum AppTab: Hashable {
    case home, diary, routine, search
}

enum Route: Hashable {
    case detail(id: UUID)
    case newEntry
}

@Observable
final class Router {
    var selectedTab: AppTab = .home
    
    var homePath: [Route] = []
    var diaryPath: [Route] = []
    var routinePath: [Route] = []
        
    var pendingDiaryCategory: TypeDiary?
    
    func openDiary(_ category: TypeDiary) {
        diaryPath.removeAll()
        pendingDiaryCategory = category
        selectedTab = .diary
    }
    
    func popToRoot(_ tab: AppTab) {
        switch tab {
        case .home:
            homePath.removeAll()
        case .diary:
            diaryPath.removeAll()
        case .routine:
            routinePath.removeAll()
        case .search:
            break
        }
    }
    
    func push(_ route: Route, on tab: AppTab) {
        switch tab {
        case .home:
            homePath.append(route)
        case .diary:
            diaryPath.append(route)
        case .routine:
            routinePath.append(route)
        case .search:
            homePath.append(route)
        }
    }
}
