import SwiftUI

struct WashView: View {
    @AppStorage("moneyEarnedByWash") var moneyEarnedByWash: Double = 0.0
    @State private var passingMoneyEarned: Double = 0.0
    @Binding var teeth : Int
    @Binding var shower : Bool
    @Binding var hair : Bool
    @Binding var beard : Bool
    @Binding var nails : Bool
    @Binding var airbrows : Bool
    @Binding var thingsWashed: Int
    @Binding var moneyEarnedToday: Double
    @Binding var washReached : Double
    @Binding var moneyEarned: Double
    var body: some View {
        NavigationLink(destination: WashModifierView(moneyEarnedByWash: $moneyEarnedByWash)) {
            HStack {
                Text("Wash")
                Divider()
                Spacer()
                Text("\(thingsWashed) / 7")
            }
        }
        HStack {
            Text("Teeth")
            Button (action: {
                teeth += 1
                if teeth < 3 {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                teeth -= 1
                if teeth < 2 {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
            ProgressView(value: Double(teeth), total: 2)
                .progressViewStyle(barColor(color: .blue))
        }
        HStack {
            Text("Cold shower")
            Button (action: {
                shower.toggle()
                if shower {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                } else {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: shower ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)
            Spacer()
            Divider()
            Spacer()
            Text("Hair")
            Button (action: {
                hair.toggle()
                if hair {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                } else {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: hair ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)
        }
        HStack {
            Text("Beard")
            Button (action: {
                beard.toggle()
                if beard {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                } else {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: beard ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)
            SpacerDivisorSpacerView()
            Text("Nails")
            Button (action: {
                nails.toggle()
                if nails {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                } else {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: nails ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)
            SpacerDivisorSpacerView()
            Text("Airbrows")
            Button (action: {
                airbrows.toggle()
                if airbrows {
                    thingsWashed += 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                } else {
                    thingsWashed -= 1
                    (passingMoneyEarned, washReached) = goalReacher(actualValue: Double(thingsWashed), goalValue: 7, alreadyReached: washReached, amountOfMoneyEarned: moneyEarnedByWash)
                    if moneyEarnedByWash != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }
            }) {
                Image(systemName: airbrows ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)

        }
    }
}

struct WashView_Previews: PreviewProvider {
    static var previews: some View {
        WashView(teeth: .constant(0), shower: .constant(false), hair: .constant(false), beard: .constant(false), nails: .constant(false), airbrows: .constant(false), thingsWashed: .constant(0), moneyEarnedToday: .constant(0), washReached: .constant(0), moneyEarned: .constant(0))
    }
}
