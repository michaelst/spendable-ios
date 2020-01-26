//
//  AttributeEditorView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/25/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AttributeEditorView: View {
    @State var attribute: String
    var navBarTitle: String
    var data: [String: Any]
    var object: Any
    var type: Any
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View {
        Button(action: {
            data[object.id] = object
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left").padding()
        }
    }
    
    var body: some View {
        VStack {
            Form {
                TextField(navBarTitle, text: $attribute)
            }
            Spacer()
        }
        .navigationBarTitle(navBarTitle)
        .navigationBarItems(leading: btnBack)
        .navigationBarBackButtonHidden(true)
    }
}
