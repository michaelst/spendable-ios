//
//  AuthView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @EnvironmentObject var userData: UserData
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    var window: UIWindow?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 116 / 255, blue: 217 / 255).edgesIgnoringSafeArea(.all)
                
                VStack {
                    SignInWithApple()
                        .frame(width: 280, height: 60)
                        .onTapGesture(perform: showAppleLogin)
                    
                    /*
                     NavigationLink(destination: LoginView()) {
                     HStack() {
                     Spacer()
                     Text("Sign in").foregroundColor(Color(red: 0, green: 116 / 255, blue: 217 / 255))
                     Spacer()
                     }
                     .padding()
                     .background(Color.white)
                     .padding(8)
                     }
                     .padding(.bottom, 4)
                     NavigationLink(destination: SignupView()) {
                     HStack() {
                     Spacer()
                     Text("Sign up").foregroundColor(Color.white)
                     Spacer()
                     }
                     .padding()
                     .background(Color(red: 67 / 255, green: 150 / 255, blue: 223 / 255))
                     .padding(8)
                     }
                     */
                }
                .padding()
            }
        }
    }
    
    private func showAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        performSignIn(using: [request])
    }
    
    private func performSignIn(using requests: [ASAuthorizationRequest]) {
        appleSignInDelegates = SignInWithAppleDelegates(window: window) { token in
            self.userData.signInWithApple(token: token)
        }
        
        let controller = ASAuthorizationController(authorizationRequests: requests)
        controller.delegate = appleSignInDelegates
        controller.presentationContextProvider = appleSignInDelegates
        
        controller.performRequests()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
