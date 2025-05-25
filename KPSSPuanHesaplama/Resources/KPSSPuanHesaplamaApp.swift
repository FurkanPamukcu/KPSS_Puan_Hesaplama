//
//  KPSSPuanHesaplamaApp.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

@main
struct KPSSPuanHesaplamaApp: App {
    
    init() {
        
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearanceTab
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
