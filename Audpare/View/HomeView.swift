import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .compare  // ✅ Tracks selected tab
    
    var body: some View {
        ZStack {
            // ✅ Wooden Background
            Image("Wooden")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay((Color.black.opacity(0.3)))
            VStack {
                ScrollView {
                Text("🎵 Aupare")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)



                Spacer()

                // ✅ Scrollable Content
                
                    VStack {
                        switch selectedTab {
                        case .compare: CompareView()
                        case .profile: ProfileView()
                        case .settings: SettingsView()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 100)
                }
            }

            // ✅ Floating Tab Bar
            VStack {
                Spacer()
                FloatingTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
        }
    }
}

// ✅ Tab Options Enum
enum Tab: String, CaseIterable {
    case compare = "Compare"
    case profile = "Profile"
    case settings = "Settings"

    var icon: String {
        switch self {
        case .compare: return "waveform.path.ecg"
        case .profile: return "person.crop.circle"
        case .settings: return "gearshape"
        }
    }
}
struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
            .font(.title)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
            .font(.title)
    }
}
// ✅ SwiftUI Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
