import SwiftUI

struct firstLineMoney: View {
    @Binding var title: String
    @Binding var actualValue: Double
    @Binding var goalValue: Double
    @State var unit: String
    var body: some View {
        HStack {
            Text(title)
            SpacerDivisorSpacerView()
            Text("\(formattedValue(actualValue)) / \(formattedValue(goalValue)) \(unit)")
        }
    }
}

struct firstOnlyLineHabit: View {
    @Binding var dailyDone: Bool
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedBy: Double
    var title: String
    var goal: String
    var color: Color
    var body: some View {
        HStack {
            Text(title)
            Divider()
            Spacer()
            Text(goal)
                .foregroundColor(dailyDone ? color : .gray)
            Button (action: {
                dailyDone.toggle()
                if dailyDone {
                    moneyEarnedToday += moneyEarnedBy
                    moneyEarned += moneyEarnedBy
                } else {
                    moneyEarnedToday -= moneyEarnedBy
                    moneyEarned -= moneyEarnedBy
                }
            }) {
                Image(systemName: dailyDone ? "xmark.circle.fill" : "checkmark.circle.fill")
            }
            .buttonStyle(.borderless)
            .foregroundColor(dailyDone ? color : .gray)
        }
    }
}

struct firstLineHabitWater: View {
    @Binding var dailyDone: Double
    @Binding var dailyGoal: Double
    @State var title: String
    @State var unit: String
    var body: some View {
        HStack {
            Text(title)
            Divider()
            Spacer()
            Text("\(Int(dailyDone)) / \(Int(dailyGoal)) \(unit)")
        }
    }
}

struct firstLineHabitNoLimits: View {
    @Binding var dailyDone: Int
    var title: String
    var unit: String
    var body: some View{
        HStack {
            Text(title)
            Divider()
            Spacer()
            Text("\(dailyDone) \(unit)")
        }
    }
}
