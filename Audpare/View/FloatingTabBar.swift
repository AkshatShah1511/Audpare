//
//  FloatingTabBar.swift
//  Audpare
//
//  Created by Akshat on 09/02/25.
//


import SwiftUI

struct FloatingTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    VStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                            .foregroundColor(selectedTab == tab ? .yellow : .white)
                        Text(tab.rawValue)
                            .font(.caption)
                            .foregroundColor(selectedTab == tab ? .yellow : .white)
                    }
                    .padding(15)
                }
            }
        }
        .background(Color.brown.opacity(0.8))
        .cornerRadius(20)
    }
}