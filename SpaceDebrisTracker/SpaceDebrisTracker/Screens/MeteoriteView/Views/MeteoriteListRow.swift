//
//  MeteoriteListRow.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 13.04.2024.
//

import SwiftUI

struct MeteoriteListRow: View {
    let meteor: MeteoriteModel
    var action: () -> ()
    
    var body: some View {
        VStack(spacing: 12) {
            LabeledContent {
                Text("More info")
                Image(systemName: "chevron.right")
            } label: {
                HStack(alignment: .center) {
                    Image(.meteorIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                    
                    Text(meteor.name)
                        .font(.title3)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(radius: 3)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    MeteoriteListRow(meteor: MeteoriteModel.Mock[1]) {}
}
