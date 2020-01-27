//
//  SignupView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct SignupView : View {
    
    @EnvironmentObject var userData: UserData
    @State var email : String = ""
    @State var password : String = ""
    @State var firstName : String = ""
    @State var lastName : String = ""
    
    let apollo = Apollo()
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 116 / 255, blue: 217 / 255).edgesIgnoringSafeArea(.all)
            
            VStack() {
                ZStack(alignment: .leading) {
                    if firstName.isEmpty { Text("first name").foregroundColor(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)) }
                    TextField("first name", text: $firstName)
                }
                .padding()
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .padding(4)
                
                ZStack(alignment: .leading) {
                    if lastName.isEmpty { Text("last name").foregroundColor(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)) }
                    TextField("last name", text: $lastName)
                }
                .padding()
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .padding(4)
                
                ZStack(alignment: .leading) {
                    if email.isEmpty { Text("email").foregroundColor(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)) }
                    TextField("email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .padding(4)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty { Text("password").foregroundColor(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)) }
                    SecureField("password", text: $password)
                }
                .padding()
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .padding(4)
                
                Button(action: { self.userData.signup(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password) }, label: {
                    HStack() {
                        Spacer()
                        Text("Sign up").foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0, green: 116 / 255, blue: 217 / 255))
                    .padding(4)
                })
            }
            .foregroundColor(.black)
            .accentColor(Color(red: 0, green: 116 / 255, blue: 217 / 255))
            .padding()
            .background(Color.white)
            .clipped()
            .shadow(radius: 8)
            .padding(.horizontal)
            .keyboardResponsive()
            .animation(.default)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
