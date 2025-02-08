//
//  CompareView.swift
//  Audpare
//
//  Created by Akshat on 09/02/25.
//


import SwiftUI

struct CompareView: View {
    @StateObject private var viewModel = AudioViewModel()  // ✅ Handles waveform comparison

    var body: some View {
        VStack {
            Text("")


            Spacer()

            // ✅ Use ContentView to compare waveforms
            ContentView(viewModel: viewModel)
        }
        .padding()
    }
}
