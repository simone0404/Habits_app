import SwiftUI

struct FruitVegModifierView: View {
    @Binding var moneyEarnedByFruitVeg: Double
    var body: some View {
        VStack {
            Text("Fruits And Vegetables Data").bold()
            VStack {
                List{
                    Section(header: Text("Modify")){
                        DataModifier(variable: $moneyEarnedByFruitVeg, name: "Earning money", capo: "\n", normalColor: .purple, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                    }
                    Section(header: Text("Suggested season fruit")){
                        SuggestedFruitView()
                    }
                    Section(header: Text("Suggested season vegetables")) {
                        SuggestedVegView()
                    }
                    captionView(number: 1, string: "The suggested portion of fruit and vegetable is 80g")
                }
            }
        }
        .foregroundColor(.purple)
    }
}

struct FruitVegModifierView_Previews: PreviewProvider {
    static var previews: some View {
        FruitVegModifierView(moneyEarnedByFruitVeg: .constant(0.5))
    }
}
