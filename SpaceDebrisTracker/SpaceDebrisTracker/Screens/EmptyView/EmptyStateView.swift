//
//  EmptyStateView.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 15.04.2024.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        Text("No records found")
            .font(.title)
            .foregroundColor(.gray)
            .padding()
    }
}

#Preview {
    EmptyStateView()
}
