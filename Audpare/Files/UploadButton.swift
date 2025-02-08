//
//  UploadButton.swift
//  Audpare
//
//  Created by Akshat on 09/02/25.
//


import SwiftUI

struct UploadButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.brown.opacity(0.8))  // ✅ Matches Compare button theme
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}
