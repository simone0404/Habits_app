import SwiftUI

struct MoneyView: View {
    @AppStorage("moneyTitle") var moneyTitle: String = "xxxxxxxxxxxx"
    @AppStorage("moneyGoal") var moneyGoal: Double = 0.0
    @AppStorage("startDateString") var startDateString: String = "01/01/2023"
    @AppStorage("endDateString") var endDateString: String = "01/01/2028"
    @State private var moneyEarnedTodayString: String = ""
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           return formatter
       }
    var body: some View {
        let endDate = dateFormatter.date(from: endDateString) ?? Date()
        let daysInterval = daysBetweenDates(endDate: endDate)
        let moneyToEarnToday = (moneyGoal - moneyEarned) / Double(daysInterval)
        NavigationView {
            List {
                Section {
                    NavigationLink (destination: MoneyModifierView(moneyTitle: $moneyTitle, moneyGoal: $moneyGoal, startDateString: $startDateString, endDateString: $endDateString) ) {
                        firstLineMoney(title: $moneyTitle, actualValue: $moneyEarned, goalValue: $moneyGoal, unit: "€")
                    }
                    HStack {
                        Text("Daily goal\n\(moneyToEarnToday, specifier: "%.2f") €")
                            .multilineTextAlignment(.center)
                        Divider()
                        Text("Earned Today\n\(moneyEarnedToday, specifier: "%.2f") €")
                            .multilineTextAlignment(.center)
                            .foregroundColor(moneyEarnedToday < moneyToEarnToday ? .gray : .green)
                        Divider()
                        ButtonMoneyAdder(moneyEarnedTodayy: $moneyEarnedToday, moneyEarnedd: $moneyEarned, string: "", keyboard: .numbersAndPunctuation, maxWords: 6, unit: " €")
                    }
                    HStack {
                        Spacer()
                        Text("Starting Date\n\(startDateString)")
                            .multilineTextAlignment(.center)
                        SpacerDivisorSpacerView()
                        Text("Ending Date\n\(endDateString)")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    ProgressBar(actualValue: $moneyEarned, totalValue: $moneyGoal, color: .green)
                }
                .foregroundColor(.green)
            }
            .toolbarTitle("Money")
        }
    }
}

struct MoneyView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyView(moneyEarnedToday: .constant(0.0), moneyEarned: .constant(0.0))
    }
}
