import SwiftUI

struct YogaView: View {
    @AppStorage("moneyEarnedByYoga") var moneyEarnedByYoga: Double = 0.0
    @Binding var dailyYogaDone: Bool
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @AppStorage("yogaMinutes") var yogaMinutes: Int = 0
    var body: some View {
        NavigationLink(destination: YogaModifierView(moneyEarnedByYoga: $moneyEarnedByYoga, dailyYogaDone: $dailyYogaDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, yogaMinutes: $yogaMinutes)) {
            firstOnlyLineHabit(dailyDone: $dailyYogaDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, moneyEarnedBy: $moneyEarnedByYoga, title: "Meditate", goal: "\(yogaMinutes) min", color: .pink)
        }
    }
}

struct YogaView_Previews: PreviewProvider {
    static var previews: some View {
        YogaView(dailyYogaDone: .constant(false), moneyEarnedToday: .constant(0), moneyEarned: .constant(0))
    }
}
