import SwiftUI

struct HabitsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("dailyWaterDone") var dailyWaterDone: Int = 0
    @AppStorage("dailyFruitVegEaten") var dailyFruitVegDone: Int = 0
    @AppStorage("dailyActivityDone") var dailyActivityDone: Double = 0.0
    @AppStorage("dailyYogaDone") var dailyYogaDone: Bool = false
    @AppStorage("dailyThinkDone") var dailyThinkDone: Bool = false
    @AppStorage("dailyNatureDone") var dailyNatureDone: Bool = false
    @AppStorage("dailySleepDone") var dailySleepDone: Bool = false
    @AppStorage("dailyStudyDone") var dailyStudyDone: Int = 0
    @AppStorage("dailyJobDrank") var dailyJobDone: Int = 0
    @AppStorage("thingsWashed") var thingsWashed: Int = 0
    @AppStorage("waterReached") var waterReached : Double = 0.0
    @AppStorage("fruitVegReached") var fruitVegReached: Double = 0.0
    @AppStorage("activityReached") var activityReached : Double = 0.0
    @AppStorage("washReached") var washReached : Double = 0.0
    @AppStorage("gymMinutes") var gymMinutes: Double = 0.0
    @AppStorage("walkMinutes") var walkMinutes: Double = 0.0
    @AppStorage("runMinutes") var runMinutes: Double = 0.0
    @AppStorage("swimMinutes") var swimMinutes: Double = 0.0
    @AppStorage("teeth") var teeth: Int = 0
    @AppStorage("shower") var shower: Bool = false
    @AppStorage("hair") var hair: Bool = false
    @AppStorage("beard") var beard: Bool = false
    @AppStorage("nails") var nails: Bool = false
    @AppStorage("airbrows") var airbrows: Bool = false
    @AppStorage("washCounter") var washCounter: Int = 0
    var weight: Double
    var height: Int
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Habits")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top, 5)
                    Spacer()
                    Button(action: {
                        dailyWaterDone = 0
                        waterReached = 0.0
                        dailyFruitVegDone = 0
                        fruitVegReached = 0.0
                        dailyActivityDone = 0.0
                        gymMinutes = 0.0
                        walkMinutes = 0.0
                        runMinutes = 0.0
                        swimMinutes = 0.0
                        moneyEarnedToday = 0.0
                        dailyYogaDone = false
                        dailyThinkDone = false
                        dailyNatureDone = false
                        dailySleepDone = false
                        dailyStudyDone = 0
                        dailyJobDone = 0
                        washCounter += 1
                        teeth = 0
                        shower = false
                        thingsWashed = 0
                        if washCounter % 2 == 0 {
                            hair = false
                        } else {
                            thingsWashed += 1
                        }
                        if washCounter % 3 == 0 {
                            beard = false
                        } else {
                            thingsWashed += 1
                        }
                        if (washCounter+1) % 3 == 0 {
                            nails = false
                        } else {
                            thingsWashed += 1
                        }
                        if (washCounter+2) % 3 == 0 {
                            airbrows = false
                        } else {
                            thingsWashed += 1
                        }
                    }){
                        Image(systemName: "clock")
                            .resizable(resizingMode: .tile)
                            .frame(width: 25.0, height: 25.0)
                    }
                    .padding(.trailing)
                }
                List {
                    Section {
                        NatureView(dailyNatureDone: $dailyNatureDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.yellow)
                    Section {
                        SleepView(dailySleepDone: $dailySleepDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.mint)
                    Section {
                        ThinkView(dailyThinkDone: $dailyThinkDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.teal)
                    Section {
                        WaterView(dailyWaterDone: $dailyWaterDone, weight: weight, height: height, moneyEarnedToday: $moneyEarnedToday, waterReached: $waterReached, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.cyan)
                    Section {
                        WashView(teeth: $teeth, shower: $shower, hair: $hair, beard: $beard, nails: $nails, airbrows: $airbrows, thingsWashed: $thingsWashed, moneyEarnedToday: $moneyEarnedToday, washReached: $washReached, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.blue)
                    Section {
                        StudyView(dailyStudyDone: $dailyStudyDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.indigo)
                    Section {
                        FruitVegView(dailyFruitVegDone: $dailyFruitVegDone, moneyEarnedToday: $moneyEarnedToday, fruitVegReached: $fruitVegReached, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.purple)
                    Section {
                        YogaView(dailyYogaDone: $dailyYogaDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.pink)
                    Section {
                        ActivityView(dailyActivityDone: $dailyActivityDone, moneyEarnedToday: $moneyEarnedToday, activityReached: $activityReached, moneyEarned: $moneyEarned, gymMinutes: $gymMinutes, walkMinutes: $walkMinutes, runMinutes: $runMinutes, swimMinutes: $swimMinutes)
                    }
                    .foregroundColor(.red)
                    Section {
                        JobView(dailyJobDone: $dailyJobDone, moneyEarnedToday: $moneyEarnedToday, moneyEarned: $moneyEarned)
                    }
                    .foregroundColor(.brown)
                }
                    /*.navigationBarTitleDisplayMode(.inline)
                    .toolbarTitle("Habits")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                dailyWaterDone = 0
                                waterReached = 0.0
                                dailyFruitVegDone = 0
                                fruitVegReached = 0.0
                                dailyActivityDone = 0.0
                                gymMinutes = 0.0
                                walkMinutes = 0.0
                                runMinutes = 0.0
                                swimMinutes = 0.0
                                moneyEarnedToday = 0.0
                                dailyYogaDone = false
                                dailyThinkDone = false
                                dailyNatureDone = false
                                dailySleepDone = false
                                dailyStudyDone = 0
                                dailyJobDone = 0
                                washCounter += 1
                                teeth = 0
                                shower = false
                                thingsWashed = 0
                                if washCounter % 2 == 0 {
                                    hair = false
                                } else {
                                    thingsWashed += 1
                                }
                                if washCounter % 3 == 0 {
                                    beard = false
                                } else {
                                    thingsWashed += 1
                                }
                                if (washCounter+1) % 3 == 0 {
                                    nails = false
                                } else {
                                    thingsWashed += 1
                                }
                                if (washCounter+2) % 3 == 0 {
                                    airbrows = false
                                } else {
                                    thingsWashed += 1
                                }
                            }){
                                Image(systemName: "clock")
                            }
                        }
                    }*/
                
            }
            .background(
                colorScheme == .dark ?
                Color.black :
                Color(red: 0.95, green: 0.95, blue: 0.95)
        )
        }
    }
}


struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView(weight: 65, height: 180, moneyEarnedToday: .constant(0), moneyEarned: .constant(0.0))
    }
}
