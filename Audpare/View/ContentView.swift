import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AudioViewModel  // ✅ Receives ViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Upload & Compare Audio")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)

            // ✅ File Pickers
            HStack {
                AudioPickerView(viewModel: viewModel, isOriginal: true)
                    .backgroundStyle(Color.brown.opacity(0.8)) 
                AudioPickerView(viewModel: viewModel, isOriginal: false)
            }
            .padding()

  

            // ✅ Compare Button
            if viewModel.originalAudio != nil && viewModel.secondAudio != nil {
                Button(action: {
                    if let originalURL = viewModel.originalAudio?.url,
                       let secondURL = viewModel.secondAudio?.url {
                        viewModel.extractWaveform(from: originalURL, isOriginal: true)
                        viewModel.extractWaveform(from: secondURL, isOriginal: false)
                    }
                }) {
                    Text("Compare Waveforms")
                        .font(.headline)
                        .padding()
                        .background(Color.brown.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
            }

            // ✅ Display Waveforms
            if !viewModel.originalWaveform.isEmpty || !viewModel.secondWaveform.isEmpty {
                WaveformComparisonView(viewModel: viewModel)
            }
        }
        .padding()
    }
}
