//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName: String = (UserDefaults.standard.string(forKey: "first name key") ?? "Default First Name");
    let lastName: String =  (UserDefaults.standard.string(forKey: "last name key") ?? "Default Last Name");
    let email: String = (UserDefaults.standard.string(forKey: "email key") ?? "Default Email");
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("profile-image-placeholder")
            
            Text(firstName)
            Text(lastName)
            Text(email)
            Spacer()
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    UserProfile()
}
