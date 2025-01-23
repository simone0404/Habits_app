import SwiftUI

struct WaterView: View {
    @AppStorage("firstWaterAdder") var firstWaterAdder: Int = 200
    @AppStorage("secondWaterAdder") var secondWaterAdder: Int = 650
    @AppStorage("moneyEarnedByWater") var moneyEarnedByWater: Double = 0.0
    @State private var passingMoneyEarned: Double = 0.0
    @State private var addWaterString: String = ""
    @Binding var dailyWaterDone: Int
    var weight: Double
    var height: Int
    @Binding var moneyEarnedToday: Double
    @Binding var waterReached : Double
    @Binding var moneyEarned: Double
    var waterToDrink: Int {
            return Int((Double(height) + weight) * 10 * waterSeasonMultiplier())
        }
    var body: some View {
        NavigationLink(destination: WaterModifierView(firstWaterAdder: $firstWaterAdder, secondWaterAdder: $secondWaterAdder, moneyEarnedByWater: $moneyEarnedByWater)) {
            HStack {
                Text("Water")
                Divider()
                Spacer()
                Text("\(dailyWaterDone) / \(waterToDrink) mL")
            }
        }
        HStack {
            ButtonAdderPlus(boxAdder: $firstWaterAdder, dailyDone: $dailyWaterDone, Reached: $waterReached, moneyEarnedBy: $moneyEarnedByWater, toDo: waterToDrink, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, unit: "mL", width: 59)
            Divider()
            ButtonAdderPlus(boxAdder: $secondWaterAdder, dailyDone: $dailyWaterDone, Reached: $waterReached, moneyEarnedBy: $moneyEarnedByWater, toDo: waterToDrink, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, unit: "mL", width: 59)
            Divider()
            ButtonAdderWithCheck(dailyDone: $dailyWaterDone, Reached: $waterReached, moneyEarnedBy: $moneyEarnedByWater, toDo: waterToDrink, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned, string: "", maxWords: 4, unit: "mL")
            
        }
        ProgressBarInt(actualValue: $dailyWaterDone, totalValue: waterToDrink, color: .cyan)
    }
}


struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView(dailyWaterDone: .constant(2500), weight: 65.0, height: 184, moneyEarnedToday: .constant(0), waterReached: .constant(0), moneyEarned: .constant(0.0))
    }
}
