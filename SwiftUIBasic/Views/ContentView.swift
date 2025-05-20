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



#Preview {
    ContentView()
}
