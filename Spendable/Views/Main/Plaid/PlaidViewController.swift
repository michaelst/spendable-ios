//
//  PlaidViewController.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import UIKit
import SwiftUI
import LinkKit

class PlaidViewController: UIViewController {
    
    let apollo = Apollo()
    
    convenience init(userData: UserData, bankData: BankData) {
        self.init()
        self.userData = userData
        self.bankData = bankData
    }
    
    var userData: UserData?
    var bankData: BankData?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentPlaidLinkWithSharedConfiguration()
    }
    
    func handleSuccessWithToken(_ publicToken: String, metadata: [String : Any]?) {
        bankData?.createMember(publicToken: publicToken)
    }
    
    func handleError(_ error: Error, metadata: [String : Any]?) {
        presentAlertViewWithTitle("Failure", message: "error: \(error.localizedDescription)\nmetadata: \(metadata ?? [:])")
    }
    
    func presentAlertViewWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Plaid Link setup with shared configuration from Info.plist
    func presentPlaidLinkWithSharedConfiguration() {
        // <!-- SMARTDOWN_PRESENT_SHARED -->
        // With shared configuration from Info.plist
        let linkViewDelegate = self
        let linkViewController = PLKPlaidLinkViewController(delegate: linkViewDelegate)
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            linkViewController.modalPresentationStyle = .formSheet
        }
        present(linkViewController, animated: true)
        // <!-- SMARTDOWN_PRESENT_SHARED -->
    }
    
    // MARK: Start Plaid Link in update mode
    func presentPlaidLinkInUpdateMode() {
        // <!-- SMARTDOWN_UPDATE_MODE -->
        let linkViewDelegate = self
        let linkViewController = PLKPlaidLinkViewController(publicToken: "<#GENERATED_PUBLIC_TOKEN#>", delegate: linkViewDelegate)
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            linkViewController.modalPresentationStyle = .formSheet
        }
        present(linkViewController, animated: true)
        // <!-- SMARTDOWN_UPDATE_MODE -->
    }
}

// MARK: - PLKPlaidLinkViewDelegate Protocol
// <!-- SMARTDOWN_PROTOCOL -->
extension PlaidViewController : PLKPlaidLinkViewDelegate {
    
    // <!-- SMARTDOWN_DELEGATE_SUCCESS -->
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
        dismiss(animated: true) {
            self.userData?.showPlaidModal = false
            
            // Handle success, e.g. by storing publicToken with your service
            NSLog("Successfully linked account!\npublicToken: \(publicToken)\nmetadata: \(metadata ?? [:])")
            self.handleSuccessWithToken(publicToken, metadata: metadata)
        }
    }
    
    // <!-- SMARTDOWN_DELEGATE_EXIT -->
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
        dismiss(animated: true) {
            self.userData?.showPlaidModal = false
        }
    }
}
