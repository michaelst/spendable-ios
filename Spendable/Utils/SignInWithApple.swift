//
//  SignInWithApple.swift
//  Spendable
//
//  Created by Michael St Clair on 2/3/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import AuthenticationServices


final class SignInWithApple: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton()
        button.cornerRadius = 0
        return button
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
