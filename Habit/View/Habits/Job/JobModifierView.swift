import SwiftUI

struct JobModifierView: View {
    @Binding var firstJobAdder: Int
    @Binding var secondJobAdder: Int
    @Binding var moneyEarnedByJob: Double
    var body: some View {
        VStack {
            Text("Job Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifierInt(variable: $firstJobAdder, name: "First add Job's box", capo: "\n", normalColor: .brown, blinkColor: .green, keyboard: .numberPad, maxWords: 5, unit: "€")
                    DataModifierInt(variable: $secondJobAdder, name: "Second add Job's box", capo: "\n", normalColor: .brown, blinkColor: .green, keyboard: .numberPad, maxWords: 5, unit: "€")
                    DataModifier(variable: $moneyEarnedByJob, name: "Earning money", capo: "\n", normalColor: .brown, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 3, unit: "€ / €")
                }
            }
        }
        .foregroundColor(.brown)
    }
}


struct JobModifierView_Previews: PreviewProvider {
    static var previews: some View {
        JobModifierView(firstJobAdder: .constant(0), secondJobAdder: .constant(0), moneyEarnedByJob: .constant(0))
    }
}
