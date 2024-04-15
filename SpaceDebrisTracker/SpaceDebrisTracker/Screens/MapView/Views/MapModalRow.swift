//
//  ModalRow.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 15.04.2024.
//

import SwiftUI

struct MapModalRow: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .padding(8)
                .foregroundColor(Color.white)
                .background(Color.lightPink)
                .clipShape(Circle())
                .font(.system(size: 24, weight: .medium))
            Text(title)
        }
    }
}

#Preview {
    MapModalRow(title: "4000g", image: "scalemass.fill")
}
