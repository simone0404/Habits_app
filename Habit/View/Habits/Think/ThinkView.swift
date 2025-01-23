import SwiftUI

struct ThinkView: View {
    @AppStorage("moneyEarnedByThink") var moneyEarnedByThink: Double = 0.0
    @Binding var dailyThinkDone: Bool
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @AppStorage("thinkMinutes") var thinkMinutes: Int = 0
    var body: some View {
        NavigationLink(destination: ThinkModifierView(moneyEarnedByThink: $moneyEarnedByThink, dailyThinkDone: $dailyThinkDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, thinkMinutes: $thinkMinutes)) {
            firstOnlyLineHabit(dailyDone: $dailyThinkDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, moneyEarnedBy: $moneyEarnedByThink, title: "Think", goal: "\(thinkMinutes) min", color: .teal)
        }
    }
}

struct ThinkView_Previews: PreviewProvider {
    static var previews: some View {
        ThinkView(dailyThinkDone: .constant(false), moneyEarnedToday: .constant(0), moneyEarned: .constant(0))
    }
}

