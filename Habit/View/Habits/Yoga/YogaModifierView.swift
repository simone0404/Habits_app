import SwiftUI

struct YogaModifierView: View {
    @Binding var moneyEarnedByYoga: Double
    @Binding var dailyYogaDone: Bool
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var yogaMinutes: Int
    var body: some View {
        VStack {
            Text("Yoga Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifier(variable: $moneyEarnedByYoga, name: "Earning money", capo: " ", normalColor: .pink, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                    DataModifierInt(variable: $yogaMinutes, name: "Minutes", capo: " ", normalColor: .pink, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: " min")
                }
                Section(header: Text("Timer")) {
                    YogaTimerView(dailyYogaDone: $dailyYogaDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, moneyEarnedByYoga: $moneyEarnedByYoga, numberOfMinutes: 15, name: "Yoga", color: .pink)
                }
            }
        }
        .foregroundColor(.pink)
    }
}

