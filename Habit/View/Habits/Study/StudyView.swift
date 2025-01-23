import SwiftUI

struct StudyView: View {
    @AppStorage("firstStudyAdder") var firstStudyAdder: Int = 20
    @AppStorage("secondStudyAdder") var secondStudyAdder: Int = 60
    @AppStorage("moneyEarnedByStudy") var moneyEarnedByStudy: Double = 0.0
    @State private var passingMoneyEarned: Double = 0.0
    @State private var addStudyString: String = ""
    @Binding var dailyStudyDone: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    var body: some View {
        NavigationLink(destination: StudyModifierView(firstStudyAdder: $firstStudyAdder, secondStudyAdder: $secondStudyAdder, moneyEarnedByStudy: $moneyEarnedByStudy, dailyStudyDone: $dailyStudyDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)) {
            firstLineHabitNoLimits(dailyDone: $dailyStudyDone, title: "Study", unit: "min")
        }
        HStack {
            Text("\(firstStudyAdder) min")
                .frame(width: 59)
            Button (action: {
                dailyStudyDone += firstStudyAdder
                moneyEarnedToday += Double(firstStudyAdder) * moneyEarnedByStudy / 60
                moneyEarned += Double(firstStudyAdder) * moneyEarnedByStudy / 60
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
            Text("\(secondStudyAdder) min")
                .frame(width: 59)
            Button (action: {
                dailyStudyDone += secondStudyAdder
                moneyEarnedToday += Double(secondStudyAdder) * moneyEarnedByStudy / 60
                moneyEarned += Double(secondStudyAdder) * moneyEarnedByStudy / 60
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
            TextField("0", text: $addStudyString)
                .keyboardType(.numberPad)
                .onChange(of: addStudyString) { newValue in
                    if newValue.count > 3 {
                        addStudyString = String(newValue.prefix(3))
                    }
                }
                .frame(width:44)
            Text("min")
            Button (action: {
                if let addNumber = Int(addStudyString){
                    dailyStudyDone += addNumber
                    moneyEarnedToday += Double(addNumber) * moneyEarnedByStudy / 60
                    moneyEarned += Double(addNumber) * moneyEarnedByStudy / 60
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addNumber = Int(addStudyString){
                    dailyStudyDone -= addNumber
                    moneyEarnedToday -= Double(addNumber) * moneyEarnedByStudy / 60
                    moneyEarned -= Double(addNumber) * moneyEarnedByStudy / 60
                    hideKeyboard()
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -15)
            .buttonStyle(.borderless)
        }
    }
}


struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView(dailyStudyDone: .constant(0), moneyEarnedToday: .constant(0), moneyEarned: .constant(0))
    }
}
