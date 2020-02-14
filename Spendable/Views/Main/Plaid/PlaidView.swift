//
//  PlaidView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct PlaidView: UIViewControllerRepresentable {
    @EnvironmentObject var userData: UserData
    var publicToken: String?
    
    func makeUIViewController(context: Context) -> PlaidViewController {
        return PlaidViewController(userData: userData, publicToken: publicToken)
    }
    
    func updateUIViewController(_ uiViewController: PlaidViewController, context: Context) {
        
    }
}
