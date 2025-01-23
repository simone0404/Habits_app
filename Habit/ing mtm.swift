import SwiftUI
import Foundation

struct ing_mtm: View {
    @State var n: CLongDouble = 0
    @State var sqrtn: CLongDouble = 0
    @State var i: CLongDouble = 0
    var body: some View {
        List{
            DataModifier(variable: $n, name: "numero di cui fare radice: ", capo: "", normalColor: .black, blinkColor: .red, keyboard: .decimalPad, maxWords: 10, unit: "")
            HStack {
                Button(action: {
                    while (i<6) {
                        while (sqrtn * sqrtn) < n {
                            sqrtn += 1 * CLongDouble(pow(10.0,CLongDouble(-i)))
                        }
                        sqrtn -= 1 * CLongDouble(pow(10.0,CLongDouble(-i)))
                        i += 1
                    }}
                ) {
                    Image(systemName: "plus.circle.fill")
                }
                .buttonStyle(.bordered)
                Text("la radice è \(sqrtn)")
            }
        }
    }
}

struct ing_mtm_Previews: PreviewProvider {
    static var previews: some View {
        ing_mtm()
    }
}
