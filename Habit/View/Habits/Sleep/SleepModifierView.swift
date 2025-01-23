import SwiftUI

struct SleepModifierView: View {
    @Binding var moneyEarnedBySleep: Double
    @Binding var timeToAwake: String
    @State var isBlinkingSleep: Bool = false
    @State var sleepTimeString: String = ""
    @State var sleepLenght: Int = 0
    var body: some View {
        VStack {
            Text("Sleep Data").bold()
            List {
                Section(header: Text("Modify")) {
                    DataModifier(variable: $moneyEarnedBySleep, name: "Earning money", capo: " ", normalColor: .mint, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "€")
                    HStack {
                        Text("Awakening \(timeToAwake) ")
                            .bold()
                            .foregroundColor(isBlinkingSleep ? .red : .mint)
                        Divider()
                        Spacer()
                        TextField("0:00", text: $sleepTimeString)
                            .onChange(of: sleepTimeString) { newValue in
                                if newValue.count > 3  && sleepLenght < 18 {
                                    sleepLenght = newValue.count
                                }
                            }
                            .keyboardType(.numbersAndPunctuation)
                            .frame(width: (CGFloat(sleepLenght) + 3.0) * 7 + 15.0)
                        Text(" am")
                        ButtonModifier(variable: $timeToAwake, variableString: $sleepTimeString, blink: $isBlinkingSleep)
                    }
                }
            }
        }
        .foregroundColor(.mint)
    }
}

struct SleepModifierView_Previews: PreviewProvider {
    static var previews: some View {
        SleepModifierView(moneyEarnedBySleep: .constant(0.0), timeToAwake: .constant(""))
    }
}

