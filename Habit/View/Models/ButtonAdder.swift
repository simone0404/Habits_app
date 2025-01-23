import SwiftUI

struct ButtonMoneyAdder: View {
    @Binding var moneyEarnedTodayy: Double
    @Binding var moneyEarnedd: Double
    @State var string: String
    @State var keyboard: UIKeyboardType
    @State var maxWords: Int
    @State var unit: String
    var body: some View {
        TextField("0", text: $string)
            .keyboardType(keyboard)
            .onChange(of: string) { newValue in
                            if newValue.count > maxWords {
                                string = String(newValue.prefix(maxWords))
                            }
                        }
            .frame(width: 8 * CGFloat(maxWords))
        Text(unit)
        Button (action: {
            if let addNumber = Double(string){
                moneyEarnedTodayy += addNumber
                moneyEarnedd += addNumber
                hideKeyboard()
            }
        }) {
            Image(systemName: "plus.circle.fill")
        }
        .buttonStyle(.borderless)
        Button (action: {
            if let addNumber = Double(string){
                moneyEarnedTodayy -= addNumber
                moneyEarnedd -= addNumber
                hideKeyboard()
            }
        }) {
            Image(systemName: "minus.circle.fill")
        }
        .padding(.trailing, -20)
        .buttonStyle(.borderless)
    }
}

struct ButtonAdderPlus: View {
    @Binding var boxAdder: Int
    @Binding var dailyDone: Int
    @Binding var Reached: Double
    @Binding var moneyEarnedBy: Double
    @State var toDo: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @State var passingMoneyEarned: Double = 0.0
    var unit: String
    var width: Int
    var body: some View {
        Text("\(boxAdder) \(unit)")
            .frame(width: CGFloat(width))
        Button (action: {
            dailyDone += boxAdder
            (passingMoneyEarned, Reached) = goalReached(actualValue: dailyDone, goalValue: toDo, alreadyReached: Reached, amountOfMoneyEarned: moneyEarnedBy)
            if moneyEarnedBy != 0 {
                moneyEarnedToday += passingMoneyEarned
                moneyEarned += passingMoneyEarned
            }
        }) {
            Image(systemName: "plus.circle.fill")
        }
        .buttonStyle(.borderless)
    }
}

struct ButtonAdderWithCheck: View {
    @Binding var dailyDone: Int
    @Binding var Reached: Double
    @Binding var moneyEarnedBy: Double
    @State var toDo: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @State var passingMoneyEarned: Double = 0.0
    @State var string: String = ""
    var maxWords: Int
    var unit: String
    var body: some View{
        TextField("0", text: $string)
            .keyboardType(.numberPad)
            .onChange(of: string) { newValue in
                            if newValue.count > maxWords {
                                string = String(newValue.prefix(maxWords))
                            }
                        }
            .frame(width:44)
        Text(unit)
        Button (action: {
            if let addNumber = Int(string){
                dailyDone += addNumber
                (passingMoneyEarned, Reached) = goalReached(actualValue: dailyDone, goalValue: toDo, alreadyReached: Reached, amountOfMoneyEarned: moneyEarnedBy)
                if moneyEarnedBy != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
                hideKeyboard()
            }
        }) {
            Image(systemName: "plus.circle.fill")
        }
        .buttonStyle(.borderless)
        Button (action: {
            if let addNumber = Int(string){
                dailyDone -= addNumber
                (passingMoneyEarned, Reached) = goalReached(actualValue: dailyDone, goalValue: toDo, alreadyReached: Reached, amountOfMoneyEarned: moneyEarnedBy)
                if moneyEarnedBy != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
                hideKeyboard()
            }
        }) {
            Image(systemName: "minus.circle.fill")
        }
        .padding(.trailing, -5)
        .buttonStyle(.borderless)
    }
}
