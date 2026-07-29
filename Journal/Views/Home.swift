//
//  HomePage.swift
//  Journal
//
//  Created by Igor Carrasco on 15/07/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ListOf()
    }
}

#Preview {
    HomeView()
        .environment(Router())
}
