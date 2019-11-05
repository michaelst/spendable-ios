//
//  LoginView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct LoginView : View {
    
    @EnvironmentObject var userData: UserData
    @State var email : String = ""
    @State var password : String = ""
    
    let apollo = Apollo()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 116 / 255, blue: 217 / 255).edgesIgnoringSafeArea(.all)
                
                VStack() {
                    VStack() {
                        TextField("email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(5)
                        
                        SecureField("password", text: $password)
                            .padding()
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .padding(5)
                        
                        Button(action: { self.login() }, label: {
                            HStack() {
                                Spacer()
                                Text("Login").foregroundColor(Color.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color(red: 0, green: 116 / 255, blue: 217 / 255))
                            .padding(5)
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
        apollo.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            switch result {
            case .success(let body):
                if let data = body.data?.login {
                    self.userData.apiToken = data.token
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
