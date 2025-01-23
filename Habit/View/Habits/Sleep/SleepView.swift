import SwiftUI

struct SleepView: View {
    @AppStorage("moneyEarnedBySleep") var moneyEarnedBySleep: Double = 0.0
    @Binding var dailySleepDone: Bool
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @AppStorage("timeToAwake") var timeToAwake: String = "0:00"
    var body: some View {
        NavigationLink(destination: SleepModifierView(moneyEarnedBySleep: $moneyEarnedBySleep, timeToAwake: $timeToAwake)) {
            firstOnlyLineHabit(dailyDone: $dailySleepDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, moneyEarnedBy: $moneyEarnedBySleep, title: "Sleep", goal: "\(timeToAwake) am", color: .mint)
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView(dailySleepDone: .constant(false), moneyEarnedToday: .constant(0), moneyEarned: .constant(0))
    }
}
