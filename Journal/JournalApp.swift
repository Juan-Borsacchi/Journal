//
//  JournalApp.swift
//  Journal
//
//  Created by Juan Gabriel Borsacchi Marques on 14/07/26.
//

import SwiftUI

@main
struct JournalApp: App {
    @State private var router: Router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavView()
                .environment(router)
        }
    }
}
