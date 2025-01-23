import SwiftUI

struct ContentView: View {
    @AppStorage("moneyEarnedToday") var moneyEarnedToday: Double = 0.0
    @AppStorage("moneyEarned") var moneyEarned: Double = 0.0
    @AppStorage("weight") var weight: Double = 65.0
    @AppStorage("height") var height: Int = 180
    var body: some View {
        TabView {
            HabitsView(weight: weight,
                       height: height,
                       moneyEarnedToday: $moneyEarnedToday,
                       moneyEarned: $moneyEarned)
                .tabItem {
                    Image(systemName: "figure.run.circle")
                    Text("Habits")
                }
            MoneyView(moneyEarnedToday: $moneyEarnedToday,
                      moneyEarned: $moneyEarned)
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Money")
                }
            SettingsView(weight: $weight, 
                         height: $height)
                .tabItem {
                    Image(systemName: "gearshape.circle.fill")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
