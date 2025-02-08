//
//  HomeButton.swift
//  Audpare
//
//  Created by Akshat on 08/02/25.
//


import SwiftUI

struct HomeButton: View {
    var title: String
    var iconName: String
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.white)
            Text(title)
                .foregroundColor(.white)
                .bold()
        }
        .padding()
        .frame(width: 250)
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}