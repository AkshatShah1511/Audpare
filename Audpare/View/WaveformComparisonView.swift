import SwiftUI
import Charts

struct WaveformComparisonView: View {
    @ObservedObject var viewModel: AudioViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Waveform Comparison")
                .font(.title2)
                .bold()
                .foregroundColor(.white)

            if viewModel.originalWaveform.isEmpty || viewModel.secondWaveform.isEmpty {
                Text("No waveform data available")
                    .foregroundColor(.gray)
            } else {
                ScrollView {
                    VStack(spacing: 30) {
                        // ✅ Original Audio (Green)
                        VStack {
                            Text("Original Audio Waveform")
                                .font(.headline)
                                .foregroundColor(.green)

                            if let originalFile = viewModel.originalAudio {
                                Text("Uploaded File: \(originalFile.name)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Spacer(minLength: UIScreen.main.bounds.width / 1.25) // ✅ Center the graph
                                    Chart {
                                        ForEach(viewModel.originalWaveform.indices, id: \.self) { index in
                                            if index % 100 == 0 {
                                                LineMark(
                                                    x: .value("Time (ms)", index * 10),
                                                    y: .value("Amplitude (A)", viewModel.originalWaveform[index])
                                                )
                                                .foregroundStyle(.green)
                                            }
                                        }
                                    }
                                    .chartXAxisLabel {
                                        Text("Time (ms)")
                                            .bold()
                                            .foregroundColor(.black) // ✅ Make units bold and black
                                    }
                                    .chartYAxisLabel {
                                        Text("Amplitude (A)")
                                            .bold()
                                            .foregroundColor(.black) // ✅ Make units bold and black
                                    }
                                    .frame(height: 300)
                                    .frame(width: max(UIScreen.main.bounds.width, CGFloat(viewModel.originalWaveform.count / 10)))
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.3)))
                                    .padding()
                                }
                            }
                        }

                        // ✅ Second Audio (Blue)
                        VStack {
                            Text("Second Audio Waveform")
                                .font(.headline)
                                .foregroundColor(.blue)

                            if let secondFile = viewModel.secondAudio {
                                Text("Uploaded File: \(secondFile.name)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Spacer(minLength: UIScreen.main.bounds.width/1.25) // ✅ Center the graph
                                    Chart {
                                        ForEach(viewModel.secondWaveform.indices, id: \.self) { index in
                                            if index % 100 == 0 {
                                                LineMark(
                                                    x: .value("Time (ms)", index * 10),
                                                    y: .value("Amplitude (A)", viewModel.secondWaveform[index])
                                                )
                                                .foregroundStyle(.blue)
                                            }
                                        }
                                    }
                                    .chartXAxisLabel {
                                        Text("Time (ms)")
                                            .bold()
                                            .foregroundColor(.black) // ✅ Make units bold and black
                                    }
                                    .chartYAxisLabel {
                                        Text("Amplitude (A)")
                                            .bold()
                                            .foregroundColor(.black) // ✅ Make units bold and black
                                    }
                                    .frame(height: 300)
                                    .frame(width: max(UIScreen.main.bounds.width, CGFloat(viewModel.secondWaveform.count / 10)))
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.3)))
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
