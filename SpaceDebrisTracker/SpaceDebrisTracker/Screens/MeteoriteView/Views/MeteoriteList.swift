//
//  MeteoriteList.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 15.04.2024.
//

import SwiftUI

struct MeteoriteList: View {
    @EnvironmentObject var meteoriteVm: MeteoriteViewModel
    @EnvironmentObject var routerManager: NavigationRouter
    
    var body: some View {
        ForEach(meteoriteVm.filteredMeteorsData(), id: \.id) { meteor in
            MeteoriteListRow(meteor: meteor) {
                routerManager.push(to: .map(meteor: meteor))
            }
            .onAppear {
                meteoriteVm.loadNextData(meteor: meteor)
            }
        }
        
        if meteoriteVm.isLoading {
            ProgressView()
                .tint(.lighterPink)
        }
    }
}

#Preview {
    MeteoriteList()
        .environmentObject(MeteoriteViewModel())
        .environmentObject(NavigationRouter())
}
