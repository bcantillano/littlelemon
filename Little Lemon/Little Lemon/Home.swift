//
//  Home.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu().tabItem(){
                Label("Locations", systemImage: "list.dash")
            }
            UserProfile().tabItem(){
                Label("Profile", systemImage: "square.and.pencil")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
