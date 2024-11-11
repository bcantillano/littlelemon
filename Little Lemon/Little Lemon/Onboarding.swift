//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/7/24.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var isLoggedIn: Bool = false;
    
    @State var firstName: String = "";
    @State var lastName: String = "";
    @State var email: String = "";
        
    var body: some View {
        NavigationView(){
            VStack {
                NavigationLink("",destination: Home(), isActive: $isLoggedIn)
                
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Registration", action: {
                    if !firstName.isEmpty
                        && !lastName.isEmpty
                        && !email.isEmpty{
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true;
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    }
                }).background(Color.gray)
            }.onAppear(){
                if UserDefaults.standard.bool(forKey: "kIsLoggedIn"){
                    isLoggedIn = true;
                }
            }
        }
    
    }
}

#Preview {
    Onboarding()
}
