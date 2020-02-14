//
//  SignInWithAppleDelegates.swift
//  Spendable
//
//  Created by Michael St Clair on 2/12/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
  private let signInSucceeded: (String) -> Void
  private weak var window: UIWindow!
  
  init(window: UIWindow?, onSignedIn: @escaping (String) -> Void) {
    self.window = window
    self.signInSucceeded = onSignedIn
  }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
        if let identityToken = appleIDCredential.identityToken {
            self.signInSucceeded(String(decoding: identityToken, as: UTF8.self))
        }

      break
      
    default:
      break
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
  }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return self.window
  }
}
