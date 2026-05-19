//
//  SettingsView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/12/26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) private var model
    
    @State private var filterExplicit = false
    
    var body: some View {
        VStack {
            Toggle("Filter Explicit Language: ", isOn: $filterExplicit)
                .onChange(of: filterExplicit) { _, newVal in
                    model.filterExplicit = newVal
                }
            .fixedSize()
        }
        .task {
            filterExplicit = model.filterExplicit
        }
    }
    
}

#Preview {
    SettingsView()
        .environment(GameViewModel())
}
