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
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
