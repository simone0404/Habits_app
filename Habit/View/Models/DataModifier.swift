import SwiftUI

struct DataModifier: View {
    @Binding var variable: Double
    @State var variableString : String = ""
    @State var blink: Bool = false
    var name: String
    var capo: String
    var normalColor: Color
    var blinkColor: Color
    var keyboard: UIKeyboardType
    var maxWords: Int
    var unit: String
    var body: some View {
        HStack {
            Text("\(name + capo)\(String(variable)) \(unit)")
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(blink ? blinkColor : normalColor)
            Divider()
            Spacer()
            TextField("0", text: $variableString)
                .keyboardType(keyboard)
                .onChange(of: variableString) { newValue in
                    if newValue.count > maxWords {
                        variableString = String(newValue.prefix(maxWords))
                    }
                }
                .frame(width: 8 * CGFloat(maxWords))
            Text(" \(unit)")
            Button(action: {
                if let changer = Double(variableString) {
                    variable = changer
                    variableString = ""
                    hideKeyboard()
                    blink = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                        blink = false
                    }
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
        }
    }
}

struct DataModifierDoubleToInt: View {
    @Binding var variable: Double
    @State var name: String
    @State var capo: String
    @State var normalColor: Color
    @State var blinkColor: Color
    @State var keyboard: UIKeyboardType
    @State var maxWords: Int
    @State var unit: String
    @State var variableString : String = ""
    @State var blink: Bool = false
    var body: some View {
        HStack {
            Text("\(name + capo)\(String(Int(variable))) \(unit)")
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(blink ? blinkColor : normalColor)
            Divider()
            Spacer()
            TextField("0", text: $variableString)
                .keyboardType(keyboard)
                .onChange(of: variableString) { newValue in
                    if newValue.count > maxWords {
                        variableString = String(newValue.prefix(maxWords))
                    }
                }
                .frame(width: 8 * CGFloat(maxWords))
            Text(" \(unit)")
            Button(action: {
                if let changer = Double(variableString) {
                    variable = changer
                    variableString = ""
                    hideKeyboard()
                    blink = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                        blink = false
                    }
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
        }
    }
}

struct DataModifierInt: View {
    @Binding var variable: Int
    @State var name: String
    @State var capo: String
    @State var normalColor: Color
    @State var blinkColor: Color
    @State var keyboard: UIKeyboardType
    @State var maxWords: Int
    @State var unit: String
    @State var variableString : String = ""
    @State var blink: Bool = false
    var body: some View {
        HStack {
            Text("\(name + capo)\(String(variable)) \(unit)")
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(blink ? blinkColor : normalColor)
            Divider()
            Spacer()
            TextField("0", text: $variableString)
                .keyboardType(keyboard)
                .onChange(of: variableString) { newValue in
                    if newValue.count > maxWords {
                        variableString = String(newValue.prefix(maxWords))
                    }
                }
                .frame(width: 8 * CGFloat(maxWords))
            Text(" \(unit)")
            Button(action: {
                if let changer = Int(variableString) {
                    variable = changer
                    variableString = ""
                    hideKeyboard()
                    blink = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                        blink = false
                    }
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
        }
    }
}

struct DataModifier_Previews: PreviewProvider {
    static var previews: some View {
        DataModifier(variable: .constant(0.0), name: "ciao", capo: "\n", normalColor: .black, blinkColor: .green, keyboard: .default, maxWords: 5, unit: "€")
    }
}


