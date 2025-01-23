import SwiftUI

struct ThinkModifierView: View {
    @AppStorage("i1") var i1: String = ""
    @AppStorage("i2") var i2: String = ""
    @AppStorage("i3") var i3: String = ""
    @AppStorage("i4") var i4: String = ""
    @AppStorage("i5") var i5: String = ""
    @AppStorage("i6") var i6: String = ""
    @AppStorage("i7") var i7: String = ""
    @AppStorage("i8") var i8: String = ""
    @AppStorage("i9") var i9: String = ""
    @AppStorage("i10") var i10: String = ""
    @Binding var moneyEarnedByThink: Double
    @Binding var dailyThinkDone: Bool
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var thinkMinutes: Int
    var body: some View {
        VStack {
            Text("Think Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifier(variable: $moneyEarnedByThink, name: "Earning money", capo: " ", normalColor: .teal, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                    DataModifierInt(variable: $thinkMinutes, name: "Minutes", capo: " ", normalColor: .teal, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                }
                Section(header: Text("Timer")) {
                    YogaTimerView(dailyYogaDone: $dailyThinkDone, moneyEarned: $moneyEarned, moneyEarnedToday: $moneyEarnedToday, moneyEarnedByYoga: $moneyEarnedByThink, numberOfMinutes: 20, name: "Think", color: .teal)
                }
                Section(header: Text("Ideas")) {
                    ThinkIdeasView(idea: $i1)
                    ThinkIdeasView(idea: $i2)
                    ThinkIdeasView(idea: $i3)
                    ThinkIdeasView(idea: $i4)
                    ThinkIdeasView(idea: $i5)
                    ThinkIdeasView(idea: $i6)
                    ThinkIdeasView(idea: $i7)
                    ThinkIdeasView(idea: $i8)
                    ThinkIdeasView(idea: $i9)
                    ThinkIdeasView(idea: $i10)
                }
            }
        }
        .foregroundColor(.teal)
    }
}
