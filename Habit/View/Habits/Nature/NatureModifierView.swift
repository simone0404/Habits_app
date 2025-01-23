import SwiftUI
struct NatureModifierView: View {
    @Binding var moneyEarnedByNature: Double
    @Binding var dailyNatureDone: Bool
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var natureMinutes: Int
    var body: some View {
        VStack {
            Text("Nature Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifier(variable: $moneyEarnedByNature, 
                                 name: "Earning money",
                                 capo: " ",
                                 normalColor: .yellow,
                                 blinkColor: .green,
                                 keyboard: .numbersAndPunctuation,
                                 maxWords: 4,
                                 unit: "€")
                    DataModifierInt(variable: $natureMinutes, 
                                    name: "Minutes",
                                    capo: " ",
                                    normalColor: .yellow,
                                    blinkColor: .green,
                                    keyboard: .numberPad,
                                    maxWords: 3,
                                    unit: "min")
                }
                Section(header: Text("Timer")) {
                    YogaTimerView(dailyYogaDone: $dailyNatureDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, moneyEarnedByYoga: $moneyEarnedByNature, numberOfMinutes: natureMinutes, name: "Nature", color: .yellow)
                }
            }
        }
        .foregroundColor(.yellow)
    }
}
