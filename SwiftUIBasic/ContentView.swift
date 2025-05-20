import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    @State private var homePath = NavigationPath()
    @State private var notificationPath = NavigationPath()
    @State private var settingsPath = NavigationPath()

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $homePath) {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)

            NavigationStack(path: $notificationPath) {
                NotificationView()
                    .navigationTitle("Notification")
            }
            .tabItem {
                Image(systemName: "bell")
                Text("Notification")
            }
            .tag(1)

            NavigationStack(path: $settingsPath) {
                SettingView()
                    .navigationTitle("Settings")
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(2)
        }
    }
}

struct HomeView: View {
    var activities = [
        "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket",
        "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
    ]

    var colors: [Color] = [
        .blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple,
        .red,
    ]

    @State private var selected = "Baseball"
    @State private var id = 1

    var body: some View {
        VStack {
            Text("Why not try").font(.largeTitle.bold())
            Spacer()

            Circle()
                .fill(colors.randomElement() ?? .blue)
                .padding(20)
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                )
                .transition(.slide)
                .id(id)

            Text("\(selected)")
                .font(.system(size: 20))
                .padding(.bottom)
            Spacer()

            Button("Try Again") {
                withAnimation(.easeIn(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }

            }
            .buttonStyle(.borderedProminent)
        }

    }
}

struct NotificationView: View {
    var activities = [
        "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket",
        "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
    ]

    @State var selected = "Archery"

    var body: some View {
        VStack {
            Text("Notifications").font(.title)
            Spacer()

            Circle().fill(.blue)
                .padding(50)
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                )

            Text("\(selected)").font(.system(size: 20)).padding(.bottom)
            Spacer()

            Button("Try Again") {
                selected = activities.randomElement() ?? "Archery"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct SettingView: View {
    var activities = [
        "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket",
        "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
    ]

    @State var selected = "Archery"

    var body: some View {
        VStack {
            Text("Settin").font(.title)
            Spacer()

            Circle().fill(.blue)
                .padding(50)
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                )

            Text("\(selected)").font(.system(size: 20)).padding(.bottom)
            Spacer()

            Button("Try Again") {
                selected = activities.randomElement() ?? "Archery"

            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
