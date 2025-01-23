import SwiftUI

struct FruitVegView: View {
    @AppStorage("moneyEarnedByFruitVeg") var moneyEarnedByFruitVeg : Double = 0.0
    @State private var passingMoneyEarned: Double = 0.0
    @Binding var dailyFruitVegDone: Int
    @Binding var moneyEarnedToday: Double
    @Binding var fruitVegReached : Double
    @Binding var moneyEarned: Double
    var body: some View {
        NavigationLink(destination: FruitVegModifierView(moneyEarnedByFruitVeg: $moneyEarnedByFruitVeg)) {
            HStack {
                Text("Fruits and Vegetables")
                Divider()
                Spacer()
                Text("\(dailyFruitVegDone) / 4")
            }
        }
        HStack {
            Text("Fruit / vegetable")
            Button (action: {
                dailyFruitVegDone += 1
                (passingMoneyEarned, fruitVegReached) = goalReached(actualValue: dailyFruitVegDone, goalValue: 4, alreadyReached: fruitVegReached, amountOfMoneyEarned: moneyEarnedByFruitVeg)
                if moneyEarnedByFruitVeg != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                dailyFruitVegDone -= 1
                (passingMoneyEarned, fruitVegReached) = goalReached(actualValue: dailyFruitVegDone, goalValue: 4, alreadyReached: fruitVegReached, amountOfMoneyEarned: moneyEarnedByFruitVeg)
                if moneyEarnedByFruitVeg != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -5)
            .buttonStyle(.borderless)
        }
        ProgressBarInt(actualValue: $dailyFruitVegDone, totalValue: 4, color: .purple)
    }
}

struct FruitVegView_Previews: PreviewProvider {
    static var previews: some View {
        FruitVegView(dailyFruitVegDone: .constant(2), moneyEarnedToday: .constant(0), fruitVegReached: .constant(0), moneyEarned: .constant(0.0))
    }
}
