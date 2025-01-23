import SwiftUI

struct ButtonModifier: View {
    @Binding var variable: String
    @Binding var variableString: String
    @Binding var blink: Bool
    var body: some View {
        Button(action: {
            variable = variableString
            variableString = ""
            hideKeyboard()
            blink = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                blink = false
            }
            }) {
            Image(systemName: "plus.circle.fill")
        }
        .buttonStyle(.borderless)
    }
}

struct ButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModifier(variable: .constant(""), variableString: .constant(""), blink: .constant(false))
    }
}
