import SwiftUI

struct NatureView: View {
    @AppStorage("moneyEarnedByNature") var moneyEarnedByNature: Double = 0.0
    @Binding var dailyNatureDone: Bool
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @AppStorage("natureMinutes") var natureMinutes: Int = 0
    var body: some View {
        NavigationLink(destination: NatureModifierView(moneyEarnedByNature: $moneyEarnedByNature, dailyNatureDone: $dailyNatureDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, natureMinutes: $natureMinutes)) {
            firstOnlyLineHabit(dailyDone: $dailyNatureDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, moneyEarnedBy: $moneyEarnedByNature, title: "Nature", goal: "\(natureMinutes) min", color: .yellow)
        }
    }
}
