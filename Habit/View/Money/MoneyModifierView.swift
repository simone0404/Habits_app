import SwiftUI

struct MoneyModifierView: View {
    @Binding var moneyTitle: String
    @Binding var moneyGoal: Double
    @Binding var startDateString: String
    @Binding var endDateString: String
    @State private var moneyTitleString: String = ""
    @State private var startDateStringString: String = ""
    @State private var endDateStringString: String = ""
    @State private var isBlinkingFirst: Bool = false
    @State private var isBlinkingThird: Bool = false
    @State private var isBlinkingFourth: Bool = false
    @State private var titleLenght: Int = 3
    var body: some View {
        VStack {
            Text("Modify Money Data").bold()
            List {
                HStack {
                    Text("Title\n\(moneyTitle) ")
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(isBlinkingFirst ? .red : .green)
                    Divider()
                    Spacer()
                    TextField("...", text: $moneyTitleString)
                        .onChange(of: moneyTitleString) { newValue in
                            if newValue.count > 3  && titleLenght < 18 {
                                titleLenght = newValue.count
                            }
                        }
                        .keyboardType(.default)
                        .frame(width: (CGFloat(titleLenght) + 3.0) * 7)
                    ButtonModifier(variable: $moneyTitle, variableString: $moneyTitleString, blink: $isBlinkingFirst)
                }
                DataModifier(variable: $moneyGoal, name: "Money goal", capo: "\n", normalColor: .green, blinkColor: .red , keyboard: .numbersAndPunctuation, maxWords: 5, unit: "€")
                HStack {
                    Text("Starting date\n\(startDateString) ")
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(isBlinkingThird ? .red : .green)
                    Divider()
                    Spacer()
                    TextField("DDMMYYYY", text: $startDateStringString)
                        .keyboardType(.numberPad)
                        .onChange(of: startDateStringString) { newValue in
                            if newValue.count == 2 || newValue.count == 5{
                                startDateStringString.append("/")
                            } else if newValue.count > 10 {
                                startDateStringString = String(newValue.prefix(10))
                            }
                        }
                        .frame(width: 115)
                    ButtonModifier(variable: $startDateString, variableString: $startDateStringString, blink: $isBlinkingThird)
                }
                HStack {
                    Text("Ending Date\n\(endDateString) ")
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(isBlinkingFourth ? .red : .green)
                    Divider()
                    Spacer()
                    TextField("DDMMYYYY", text: $endDateStringString)
                        .keyboardType(.numberPad)
                        .onChange(of: endDateStringString) { newValue in
                            if newValue.count == 2 || newValue.count == 5{
                                endDateStringString.append("/")
                            } else if newValue.count > 10 {
                                endDateStringString = String(newValue.prefix(10))
                            }
                        }
                        .frame(width: 115)
                    ButtonModifier(variable: $endDateString, variableString: $endDateStringString, blink: $isBlinkingFourth)
                }
            }
            .foregroundColor(.green)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MoneyModifierView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyModifierView(moneyTitle: .constant("Apple vision pro"), moneyGoal: .constant(4000), startDateString: .constant("12/08/2023"), endDateString: .constant("01/07/2028"))
    }
}
