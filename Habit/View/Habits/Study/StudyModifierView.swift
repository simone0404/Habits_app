import SwiftUI

struct StudyModifierView: View {
    @Binding var firstStudyAdder: Int
    @Binding var secondStudyAdder: Int
    @Binding var moneyEarnedByStudy: Double
    @Binding var dailyStudyDone: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    var body: some View {
        VStack {
            Text("Study Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifierInt(variable: $firstStudyAdder, name: "First add study's box", capo: "\n", normalColor: .indigo, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierInt(variable: $secondStudyAdder, name: "Second add study's box", capo: "\n", normalColor: .indigo, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifier(variable: $moneyEarnedByStudy, name: "Earning money", capo: "\n", normalColor: .indigo, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 3, unit: "€ / h")
                }
                Section(header: Text("Timer")) {
                    StudyTimerView(dailyStudyDone: $dailyStudyDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, moneyEarnedByStudy: $moneyEarnedByStudy, name: "Study", color: .indigo)
                }
            }
        }
        .foregroundColor(.indigo)
    }
}
