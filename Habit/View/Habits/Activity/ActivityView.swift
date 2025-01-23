import SwiftUI

struct ActivityView: View {
    @AppStorage("firstGymAdder") var firstGymAdder: Double = 10
    @AppStorage("secondGymAdder") var secondGymAdder: Double = 30
    @AppStorage("firstWalkAdder") var firstWalkAdder: Double = 20
    @AppStorage("secondWalkAdder") var secondWalkAdder: Double = 60
    @AppStorage("firstRunAdder") var firstRunAdder: Double = 10
    @AppStorage("secondRunAdder") var secondRunAdder: Double = 30
    @AppStorage("firstSwimAdder") var firstSwimAdder: Double = 60
    @AppStorage("secondSwimAdder") var secondSwimAdder: Double = 90
    @AppStorage("moneyEarnedByActivity") var moneyEarnedByActivity: Double = 0.5
    let gymMultiplier: Double = 2.5
    let walkMultiplier: Double = 1
    let runMultiplier: Double = 2
    let swimMultiplier: Double = 1.5
    @State var passingMoneyEarned: Double = 0.0
    @State var addGymString: String = ""
    @State var addWalkString: String = ""
    @State var addRunString: String = ""
    @State var addSwimString: String = ""
    @Binding var dailyActivityDone: Double
    @Binding var moneyEarnedToday: Double
    @Binding var activityReached: Double
    @Binding var moneyEarned: Double
    @Binding var gymMinutes: Double
    @Binding var walkMinutes: Double
    @Binding var runMinutes: Double
    @Binding var swimMinutes: Double
    var body: some View {
        NavigationLink(destination: ActivityModifierView(firstGymAdder: $firstGymAdder, secondGymAdder: $secondGymAdder, firstWalkAdder: $firstWalkAdder, secondWalkAdder: $secondWalkAdder, firstRunAdder: $firstRunAdder, secondRunAdder: $secondRunAdder, firstSwimAdder: $firstSwimAdder, secondSwimAdder: $secondSwimAdder, moneyEarnedByActivity: $moneyEarnedByActivity, gymMinutes: $gymMinutes, walkMinutes: $walkMinutes, runMinutes: $runMinutes, swimMinutes: $swimMinutes, dailyActivityDone: $dailyActivityDone)) {
            HStack {
                Text("Activity")
                Divider()
                Spacer()
                Text("\(Int(dailyActivityDone)) / 100")
            }
        }
        HStack {
            HStack{
                Text("Gym\n\(Int(gymMinutes))")
                    .multilineTextAlignment(.center)
                    .padding(.leading, -4)
                Divider()
                    .padding(.leading, +1)
                Text("\(Int(firstGymAdder)) min")
                    .padding(.leading, -3)
                Button (action: {
                    dailyActivityDone += firstGymAdder * gymMultiplier
                    gymMinutes += firstGymAdder
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .buttonStyle(.borderless)
            }
            Divider()
                .padding(.leading, +3)
            Text("\(Int(secondGymAdder)) min")
                .padding(.leading, -3)
            Button (action: {
                dailyActivityDone += secondGymAdder * gymMultiplier
                gymMinutes += secondGymAdder
                (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                if moneyEarnedByActivity != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
                .padding(.leading, -2)
            TextField("0", text: $addGymString)
                .keyboardType(.numberPad)
                .onChange(of: addGymString) {newValue in
                    if newValue.count > 3 {
                        addGymString = String(newValue.prefix(3))
                    }
                }
                .frame(width: 20)
                .padding(.leading, -3)
            Text("min")
            Button (action: {
                if let addGymNumber = Double(addGymString){
                    dailyActivityDone += addGymNumber * gymMultiplier
                    gymMinutes += addGymNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addGymNumber = Double(addGymString){
                    dailyActivityDone -= addGymNumber * gymMultiplier
                    gymMinutes -= addGymNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -12)
            .buttonStyle(.borderless)
        }
        HStack {
            HStack{
                Text("Walk\n\(Int(walkMinutes))")
                    .multilineTextAlignment(.center)
                    .padding(.leading, -4)
                Divider()
                Text("\(Int(firstWalkAdder)) min")
                    .padding(.leading, -3)
                Button (action: {
                    dailyActivityDone += firstWalkAdder * walkMultiplier
                    walkMinutes += firstWalkAdder
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .buttonStyle(.borderless)
            }
            Divider()
            Text("\(Int(secondWalkAdder)) min")
                .padding(.leading, -3)
            Button (action: {
                dailyActivityDone += secondWalkAdder * walkMultiplier
                walkMinutes += secondWalkAdder
                (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                if moneyEarnedByActivity != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
                .padding(.leading, -2)
            TextField("0", text: $addWalkString)
                .keyboardType(.numberPad)
                .onChange(of: addWalkString) {newValue in
                    if newValue.count > 3 {
                        addWalkString = String(newValue.prefix(3))
                    }
                }
                .frame(width: 20)
                .padding(.leading, -4)
            Text("min")
            Button (action: {
                if let addNumber = Double(addGymString){
                    dailyActivityDone += addNumber * walkMultiplier
                    walkMinutes += addNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addNumber = Double(addGymString){
                    dailyActivityDone -= addNumber * walkMultiplier
                    walkMinutes -= addNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -20)
            .buttonStyle(.borderless)
        }
        HStack {
            HStack{
                Text("Run\n\(Int(runMinutes))")
                    .padding(.leading, -4)
                    .multilineTextAlignment(.center)
                Divider()
                    .padding(.leading, +7)
                Text("\(Int(firstRunAdder)) min")
                    .padding(.leading, -4)
                Button (action: {
                    dailyActivityDone += firstRunAdder * runMultiplier
                    runMinutes += firstRunAdder
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .buttonStyle(.borderless)
            }
            Divider()
                .padding(.leading, +3)
            Text("\(Int(secondRunAdder)) min")
                .padding(.leading, -3)
            Button (action: {
                dailyActivityDone += secondRunAdder * runMultiplier
                runMinutes += secondRunAdder
                (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                if moneyEarnedByActivity != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
                .padding(.leading, -1)
            TextField("0", text: $addRunString)
                .keyboardType(.numberPad)
                .onChange(of: addRunString) {newValue in
                    if newValue.count > 3 {
                        addRunString = String(newValue.prefix(3))
                    }
                }
                .frame(width: 20)
            Text("min")
            Button (action: {
                if let addGymNumber = Double(addRunString){
                    dailyActivityDone += addGymNumber * runMultiplier
                    runMinutes += addGymNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addGymNumber = Double(addRunString){
                    dailyActivityDone -= addGymNumber * runMultiplier
                    runMinutes -= addGymNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -20)
            .buttonStyle(.borderless)
        }
        HStack {
            HStack{
                Text("Swim\n\(Int(swimMinutes))")
                    .padding(.leading, -4)
                    .multilineTextAlignment(.center)
                Divider()
                    .padding(.leading, -4)
                Text("\(Int(firstSwimAdder)) min")
                    .padding(.leading, -4)
                Button (action: {
                    dailyActivityDone += firstSwimAdder * swimMultiplier
                    swimMinutes += firstSwimAdder
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .buttonStyle(.borderless)
            }
            Divider()
                .padding(.leading, -4)
            Text("\(Int(secondSwimAdder)) min")
                .padding(.leading, -4)
            Button (action: {
                dailyActivityDone += secondSwimAdder * swimMultiplier
                swimMinutes += secondSwimAdder
                (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100.0, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                if moneyEarnedByActivity != 0 {
                    moneyEarnedToday += passingMoneyEarned
                    moneyEarned += passingMoneyEarned
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Divider()
                .padding(.leading, -4)
            TextField("0", text: $addSwimString)
                .keyboardType(.numberPad)
                .onChange(of: addSwimString) {newValue in
                    if newValue.count > 3 {
                        addSwimString = String(newValue.prefix(3))
                    }
                }
                .frame(width: 20)
                .padding(.leading, -4)
            Text("min")
            Button (action: {
                if let addNumber = Double(addSwimString){
                    dailyActivityDone += addNumber * swimMultiplier
                    swimMinutes += addNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .buttonStyle(.borderless)
            Button (action: {
                if let addNumber = Double(addGymString){
                    dailyActivityDone -= addNumber * swimMultiplier
                    swimMinutes -= addNumber
                    (passingMoneyEarned, activityReached) = goalReacher(actualValue: dailyActivityDone, goalValue: 100, alreadyReached: activityReached, amountOfMoneyEarned: moneyEarnedByActivity)
                    if moneyEarnedByActivity != 0 {
                        moneyEarnedToday += passingMoneyEarned
                        moneyEarned += passingMoneyEarned
                    }
                    hideKeyboard()
                }
            }) {
                Image(systemName: "minus.circle.fill")
            }
            .padding(.trailing, -20)
            .buttonStyle(.borderless)
        }
        HStack {
            Text("Progress  ")
            ProgressView(value: dailyActivityDone, total: 100)
                .progressViewStyle(barColor(color: .red))
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(dailyActivityDone: .constant(0.0), moneyEarnedToday: .constant(0.0), activityReached: .constant(0.0), moneyEarned: .constant(0.0), gymMinutes: .constant(0.0), walkMinutes: .constant(0.0), runMinutes: .constant(0.0), swimMinutes: .constant(0.0))
    }
}
