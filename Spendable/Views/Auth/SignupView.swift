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
        NavigationView {
            ZStack {
                Color(red: 0, green: 116 / 255, blue: 217 / 255).edgesIgnoringSafeArea(.all)
                
                VStack() {
                    VStack() {
                        TextField("first name", text: $firstName)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(4)
                        
                        TextField("last name", text: $lastName)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(4)
                        
                        TextField("email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(4)
                        
                        SecureField("password", text: $password)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(4)
                        
                        Button(action: { self.login() }, label: {
                            HStack() {
                                Spacer()
                                Text("Sign up").foregroundColor(Color.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color(red: 0, green: 116 / 255, blue: 217 / 255))
                            .padding(8)
                        })
                    }
                    .padding()
                    .background(Color.white)
                    .clipped()
                    .shadow(radius: 10)
                }
                .padding()
            }
        }
    }
    
    private func login() {
        apollo.client.perform(mutation: CreateUserMutation(firstName: firstName, lastName: lastName, email: email, password: password)) { result in
            guard let data = try? result.get().data else { return }
            self.userData.apiToken = data.createUser?.token
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
