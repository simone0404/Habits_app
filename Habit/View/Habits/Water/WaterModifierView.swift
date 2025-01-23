import SwiftUI

struct WaterModifierView: View {
    @Binding var firstWaterAdder: Int
    @Binding var secondWaterAdder: Int
    @Binding var moneyEarnedByWater: Double
    var body: some View {
        VStack {
            Text("Water Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifierInt(variable: $firstWaterAdder, name: "First add water's box", capo: "\n", normalColor: .cyan, blinkColor: .green, keyboard: .numberPad, maxWords: 4, unit: "mL")
                    DataModifierInt(variable: $secondWaterAdder, name: "Second add water's box", capo: "\n", normalColor: .cyan, blinkColor: .green, keyboard: .numberPad, maxWords: 4, unit: "mL")
                    DataModifier(variable: $moneyEarnedByWater, name: "Earning money", capo: "\n", normalColor: .cyan, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                }
                captionView(number: 1, string: "The value of water to drink is calculated using this formula: \n10 * ( weight + height ) * season\nwhere season = 1.2 in summer and 1.0 in other seasons")
            }
        }
        .foregroundColor(.cyan)
    }
}

struct WaterModifierView_Previews: PreviewProvider {
    static var previews: some View {
        WaterModifierView(firstWaterAdder: .constant(200), secondWaterAdder: .constant(650), moneyEarnedByWater: .constant(0.3))
    }
}
