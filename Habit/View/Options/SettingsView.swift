import SwiftUI

struct SettingsView: View {
    @Binding var weight: Double
    @Binding var height: Int
    var body: some View {
        NavigationView {
            List {
                Section {
                    DataModifier(variable: $weight, name: "Weight: ", capo: "", normalColor: .gray, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 5, unit: "kg")
                    DataModifierInt(variable: $height, name: "Height: ", capo: "", normalColor: .gray, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "cm")
                }
                .foregroundColor(.gray)
            }
            .toolbarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(weight: .constant(60.0), height: .constant(180))
    }
}


