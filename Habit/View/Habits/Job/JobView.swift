import SwiftUI

struct JobView: View {
    @AppStorage("firstJobAdder") var firstJobAdder: Int = 20
    @AppStorage("secondJobAdder") var secondJobAdder: Int = 60
    @AppStorage("moneyEarnedByJob") var moneyEarnedByJob: Double = 0.0
    @State private var passingMoneyEarned: Double = 0.0
    @State private var addJobString: String = ""
    @Binding var dailyJobDone: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    var body: some View {
        NavigationLink(destination: JobModifierView(firstJobAdder: $firstJobAdder, secondJobAdder: $secondJobAdder, moneyEarnedByJob: $moneyEarnedByJob)) {
            firstLineHabitNoLimits(dailyDone: $dailyJobDone, title: "Job", unit: "€")
        }
        HStack {
            Text("\(firstJobAdder) €")
                .frame(width: 59)
            Button (action: {
                dailyJobDone += firstJobAdder
                moneyEarnedToday += Double(firstJobAdder) * moneyEarnedByJob
                moneyEarned += Double(firstJobAdder) * moneyEarnedByJob
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
            Text("\(secondJobAdder) €")
                .frame(width: 59)
            Button (action: {
                dailyJobDone += secondJobAdder
                moneyEarnedToday += Double(secondJobAdder) * moneyEarnedByJob
                moneyEarned += Double(secondJobAdder) * moneyEarnedByJob
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
            TextField("0", text: $addJobString)
                .keyboardType(.numberPad)
                .onChange(of: addJobString) { newValue in
                    if newValue.count > 5 {
                        addJobString = String(newValue.prefix(5))
                    }
                }
                .frame(width:44)
            Text("€")
            Button (action: {
                if let addNumber = Int(addJobString){
                    dailyJobDone += addNumber
                    moneyEarnedToday += Double(addNumber) * moneyEarnedByJob
                    moneyEarned += Double(addNumber) * moneyEarnedByJob
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addNumber = Int(addJobString){
                    dailyJobDone -= addNumber
                    moneyEarnedToday -= Double(addNumber) * moneyEarnedByJob
                    moneyEarned -= Double(addNumber) * moneyEarnedByJob
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


struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView(dailyJobDone: .constant(0), moneyEarnedToday: .constant(0), moneyEarned: .constant(0))
    }
}
