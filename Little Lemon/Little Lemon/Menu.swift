//
//  Menu.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Little Lemon Restaurant");
            Text("Chicago");
            Text("Your local restaurant serving fresh Mediterranean food!");
            List{}
        }
    }
}

#Preview {
    Menu()
}
