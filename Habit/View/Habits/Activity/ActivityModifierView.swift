import SwiftUI

struct ActivityModifierView: View {
    @AppStorage("l1") var l1: Int = 50
    @AppStorage("l2") var l2: Int = 25
    @AppStorage("l3") var l3: Int = 25
    @AppStorage("l4") var l4: Int = 40
    @AppStorage("l5") var l5: Int = 100
    @AppStorage("l6") var l6: Int = 40
    @AppStorage("l7") var l7: Int = 10
    @AppStorage("l8") var l8: Int = 5
    @AppStorage("l9") var l9: Int = 5
    @AppStorage("l10") var l10: Int = 10
    @AppStorage("l11") var l11: Int = 1
    @AppStorage("legsRepeat") var legsRepeat: Int = 3
    @AppStorage("a1") var a1: Int = 50
    @AppStorage("a2") var a2: Int = 25
    @AppStorage("a3") var a3: Int = 25
    @AppStorage("a4") var a4: Int = 20
    @AppStorage("a5") var a5: Int = 100
    @AppStorage("a6") var a6: Int = 15
    @AppStorage("a7") var a7: Int = 3
    @AppStorage("a8") var a8: Int = 5
    @AppStorage("a9") var a9: Int = 5
    @AppStorage("a10") var a10: Int = 10
    @AppStorage("a11") var a11: Int = 1
    @AppStorage("armsRepeat") var armsRepeat: Int = 3
    @AppStorage("c1") var c1: Int = 50
    @AppStorage("c2") var c2: Int = 25
    @AppStorage("c3") var c3: Int = 25
    @AppStorage("c4") var c4: Int = 30
    @AppStorage("c5") var c5: Int = 100
    @AppStorage("c6") var c6: Int = 30
    @AppStorage("c7") var c7: Int = 20
    @AppStorage("c8") var c8: Int = 10
    @AppStorage("c9") var c9: Int = 5
    @AppStorage("c10") var c10: Int = 10
    @AppStorage("c11") var c11: Int = 1
    @AppStorage("coreRepeat") var coreRepeat: Int = 3
    @AppStorage("rest") var rest: Int = 25
    @State var legsWorkoutString: [String] = ["","","","","","","","","","","",""]
    @State var armsWorkoutString: [String] = ["","","","","","","","","","","",""]
    @State var coreWorkoutString: [String] = ["","","","","","","","","","","",""]
    @Binding var firstGymAdder: Double
    @Binding var secondGymAdder: Double
    @Binding var firstWalkAdder: Double
    @Binding var secondWalkAdder: Double
    @Binding var firstRunAdder: Double
    @Binding var secondRunAdder: Double
    @Binding var firstSwimAdder: Double
    @Binding var secondSwimAdder: Double
    @Binding var moneyEarnedByActivity: Double
    @Binding var gymMinutes: Double
    @Binding var walkMinutes: Double
    @Binding var runMinutes: Double
    @Binding var swimMinutes: Double
    @Binding var dailyActivityDone: Double
    @State var gymBuilder: Int = 0
    @State private var timeElapsed: Int = 0
    @State private var timeElapsedDouble: Int = 0
    @State private var isRunning: Bool = false
    @State private var isRunningDouble: Bool = false
    @State private var isRunningWorkout: Bool = false
    @State private var timeElapsedWorkout: Int = 0
    private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
    func timeElapsedWorkoutChanger (gymBuilder: Int) -> (Int) {
        if gymBuilder == 0 {
            timeElapsedWorkout = l5
        } else if gymBuilder == 1 {
            timeElapsedWorkout = a5
        } else if gymBuilder == 2 {
            timeElapsedWorkout = c5
        }
        return timeElapsedWorkout
    }
    var body: some View {
        VStack {
            Text("Activity Data")
            List {
                Section(header: Text("Modify")) {
                    DataModifierDoubleToInt(variable: $firstGymAdder, name: "First add gym's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $secondGymAdder, name: "Second add gym's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $firstWalkAdder, name: "First add walk's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $secondWalkAdder, name: "Second add walk's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $firstRunAdder, name: "First add run's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $secondRunAdder, name: "Second add run's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $firstSwimAdder, name: "First add swim's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifierDoubleToInt(variable: $secondSwimAdder, name: "Second add swim's box", capo: "\n", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "min")
                    DataModifier(variable: $moneyEarnedByActivity, name: "Earning money", capo: "\n", normalColor: .red, blinkColor: .green, keyboard: .numbersAndPunctuation, maxWords: 4, unit: "  €")
                }
                Section (header: Text("Timer")) {
                    ActivityTimerView(activityMinutes: $gymMinutes, dailyActivityDone: $dailyActivityDone, name: "Gym")
                    ActivityTimerView(activityMinutes: $walkMinutes, dailyActivityDone: $dailyActivityDone, name: "Walk")
                    ActivityTimerView(activityMinutes: $runMinutes, dailyActivityDone: $dailyActivityDone, name: "Run")
                    ActivityTimerView(activityMinutes: $swimMinutes, dailyActivityDone: $dailyActivityDone, name: "Swim")
                } 
                Section (header: Text("Gym Builder")) {
                    HStack {
                        Spacer()
                        Button(action: {
                            gymBuilder = 0
                        }) {
                            Text("Legs")
                        }
                        .buttonStyle(.borderless)
                        SpacerDivisorSpacerView()
                        Button(action: {
                            gymBuilder = 1
                        }) {
                            Text("Arms")
                        }
                        .buttonStyle(.borderless)
                        SpacerDivisorSpacerView()
                        Button(action: {
                            gymBuilder = 2
                        }) {
                            Text("Core")
                        }
                        .buttonStyle(.borderless)
                        Spacer()
                    }.bold()
                    DataModifierInt(variable: $rest, name: "Resting seconds", capo: " ", normalColor: .red, blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "sec")
                    Text("")
                    if gymBuilder == 0 {
                        DataModifierInt(variable: $l1, name: "Jumping jacks", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l2, name: "Sit-ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l3, name: "Push up leg down", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $legsRepeat, name: "Repeat", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "times")
                        DataModifierInt(variable: $l4, name: "Squat", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l5, name: "Chair", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "s")
                        DataModifierInt(variable: $l6, name: "Feet", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l7, name: "Jumping jacks", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    if gymBuilder == 0 {
                        DataModifierInt(variable: $l8, name: "Barpie", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $l9, name: "Jumps", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l10, name: "Abs", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $l11, name: "Diamond push ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    if gymBuilder == 1 {
                        DataModifierInt(variable: $a1, name: "Jumping jacks", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a2, name: "Sit-ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a3, name: "Push up leg down", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $armsRepeat, name: "Repeat", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "times")
                        DataModifierInt(variable: $a4, name: "Push ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a5, name: "Plank", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "s")
                        DataModifierInt(variable: $a6, name: "Triceps", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a7, name: "Diamond", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    if gymBuilder == 1 {
                        DataModifierInt(variable: $a8, name: "Barpie", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $a9, name: "Jumps", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a10, name: "Abs", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $a11, name: "Diamond push ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    if gymBuilder == 2 {
                        DataModifierInt(variable: $c1, name: "Jumping jacks", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c2, name: "Sit-ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c3, name: "Push up leg down", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $coreRepeat, name: "Repeat", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "times")
                        DataModifierInt(variable: $c4, name: "Sit-ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c5, name: "Planck", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "s")
                        DataModifierInt(variable: $c6, name: "Mountain Climber", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c7, name: "Abs", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    if gymBuilder == 2 {
                        DataModifierInt(variable: $c8, name: "Barpie", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        Text("")
                        DataModifierInt(variable: $c9, name: "Jumps", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c10, name: "Abs", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                        DataModifierInt(variable: $c11, name: "Diamond push ups", capo: " ", normalColor: .red , blinkColor: .green, keyboard: .numberPad, maxWords: 3, unit: "")
                    }
                    
                }
                Section (header: Text("Timers")) {
                    HStack {
                        Text("Short timer")
                            .bold()
                        Divider()
                        Spacer()
                        Text(String(timeElapsed))
                            .font(isRunning ? .title : .body)
                            .fontWeight(isRunning ? .bold : .regular)
                        Button(action: {
                            isRunning = true
                        }) {
                            Image(systemName:  "play.circle.fill" )
                        }
                        .buttonStyle(.borderless)
                    }
                    .onReceive(timer) {_ in
                        if isRunning {
                            timeElapsed -= 1
                        }
                        if timeElapsed == 0 {
                            isRunning = false
                            timeElapsed = rest
                        }
                    }
                    HStack {
                        Text("Long timer")
                            .bold()
                        Divider()
                        Spacer()
                        Text(String(timeElapsedDouble))
                            .font(isRunningDouble ? .title : .body)
                            .fontWeight(isRunningDouble ? .bold : .regular)
                        Button(action: {
                            isRunningDouble = true
                        }) {
                            Image(systemName:  "play.circle.fill" )
                        }
                        .buttonStyle(.borderless)
                    }
                    .onReceive(timer) {_ in
                        if isRunningDouble {
                            timeElapsedDouble -= 1
                        }
                        if timeElapsedDouble == 0 {
                            isRunningDouble = false
                            timeElapsedDouble = rest * 2
                        }
                    }
                    HStack {
                        Text("Workout timer")
                            .bold()
                        Divider()
                        Spacer()
                        Text(String(timeElapsedWorkout))
                            .font(isRunningWorkout ? .title : .body)
                            .fontWeight(isRunningWorkout ? .bold : .regular)
                        Button(action: {
                            isRunningWorkout = true
                        }) {
                            Image(systemName:  "play.circle.fill" )
                        }
                        .buttonStyle(.borderless)
                    }
                    .onReceive(timer) {_ in
                        if isRunningWorkout {
                            timeElapsedWorkout -= 1
                        } else if timeElapsedWorkout != timeElapsedWorkoutChanger(gymBuilder: gymBuilder){
                            timeElapsedWorkout = timeElapsedWorkoutChanger(gymBuilder: gymBuilder)
                        }
                        if timeElapsedWorkout == 0 {
                            timeElapsedWorkout = timeElapsedWorkoutChanger(gymBuilder: gymBuilder)
                            isRunningWorkout = false
                        }
                    }
                }
                Section {
                    captionView(number: 1, string: "the number of points out of 100 is calculated by multipling the number of minutes an activity is done with the following multipliers:\nGym : 2.5\nWalk : 1\nRun: 2\nSwim: 1.5")
                }
            }
        }
        .foregroundColor(.red)
    }
}

struct ActivityModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityModifierView(firstGymAdder: .constant(10), secondGymAdder: .constant(30), firstWalkAdder: .constant(20), secondWalkAdder: .constant(60), firstRunAdder: .constant(10), secondRunAdder: .constant(30), firstSwimAdder: .constant(60), secondSwimAdder: .constant(90), moneyEarnedByActivity: .constant(1), gymMinutes: .constant(0.0), walkMinutes: .constant(0.0), runMinutes: .constant(0.0), swimMinutes: .constant(0.0), dailyActivityDone: .constant(0.0))
    }
}
