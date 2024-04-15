//
//  ModalView.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 15.04.2024.
//

import SwiftUI

struct MapModalView: View {
    @Binding var locationName: String
    let meteor: MeteoriteModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MapModalRow(title: locationName, image: "globe")
            
            if let mass = meteor.mass {
                MapModalRow(title: "\(mass) g", image: "scalemass.fill")
            }
            
            MapModalRow(title: meteor.recclass, image: "arkit")
            
            MapModalRow(title: meteor.readableYear, image: "calendar")
        }
        .padding()
        .padding([.top, .bottom], 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
        .bold()
        .background {
            Rectangle()
                .fill(Color.darkBlue.gradient.opacity(0.3))
        }
    }
}

#Preview {
    MapModalView(locationName: .constant("Unknown place"), meteor: MeteoriteModel.Mock[1])
}
