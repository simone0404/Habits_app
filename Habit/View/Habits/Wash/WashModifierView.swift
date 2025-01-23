import SwiftUI

struct WashModifierView: View {
    @Binding var moneyEarnedByWash: Double
    var body: some View {
        VStack {
            Text("Wash Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifier(variable: $moneyEarnedByWash, name: "Earning money", capo: " ", normalColor: .blue, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                }
            }
        }
        .foregroundColor(.blue)
    }
}

struct WashModifierView_Previews: PreviewProvider {
    static var previews: some View {
        WashModifierView(moneyEarnedByWash: .constant(0.0))
    }
}
