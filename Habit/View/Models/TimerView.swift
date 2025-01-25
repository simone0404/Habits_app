/* import SwiftUI

struct YogaTimerView: View {
    @AppStorage("hourTimers") var hourTimers: Int = 0
    @AppStorage("minuteTimers") var minuteTimers: Int = 0
    @AppStorage("secondTimers") var secondTimers: Int = 0
    @State private var blink: Int = 0
    @State private var timeElapsed: Double = 0.0
    @State private var isRunning: Bool = false
    @Binding var dailyYogaDone: Bool
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarnedByYoga: Double
    var numberOfMinutes: Int
    var name: String
    var color: Color
    private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
    var body: some View {
        let hours = Int(timeElapsed / 3600)
        let minutes = Int((timeElapsed.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeElapsed.truncatingRemainder(dividingBy: 60))
        HStack {
            Text(name)
                .bold()
                .foregroundColor(blink == 0 ? color : (blink == 1 ? .green : .black))
            Divider()
            Spacer()
            if isRunning {
                Button(action: {
                    timeElapsed = 0
                    isRunning = false
                    blink = 2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        blink = 0
                    }
                }) {
                    Text("Delete")
                }
                .buttonStyle(.borderless)
            }
            Text(String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds))
                .fontWeight(isRunning ? .bold : .regular)
            if !isRunning {
                Button(action: {
                    hourTimers = Calendar.current.component(.hour, from: Date())
                    minuteTimers = Calendar.current.component(.minute, from: Date())
                    secondTimers = Calendar.current.component(.second, from: Date())
                    isRunning.toggle()
                }) {
                    Image(systemName: "play.circle.fill")
                }
                .buttonStyle(.borderless)            }
            if isRunning {
                Button(action: {
                    if numberOfMinutes <= Int(timeElapsed / 60) {
                        dailyYogaDone = true
                        moneyEarned += moneyEarnedByYoga
                        moneyEarnedToday += moneyEarnedByYoga
                        blink = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            blink = 0
                        }
                        timeElapsed = 0
                        isRunning = false
                    }
                }) {
                    Image(systemName: "stop.circle.fill")
                }
                .buttonStyle(.borderless)
            }
        }
        .onReceive(timer) {_ in
            if isRunning {
                let secondsDifference = Calendar.current.component(.second, from: Date()) - secondTimers
                let minutesDifference = Calendar.current.component(.minute, from: Date()) - minuteTimers
                let hourDifference = Calendar.current.component(.hour, from: Date()) - hourTimers
                if secondsDifference > 0 {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + minutesDifference * 60 + secondsDifference)
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimers + Calendar.current.component(.minute, from: Date())) * 60 + secondsDifference)
                    }
                } else {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + (minutesDifference - 1) * 60 + (60 - secondTimers + Calendar.current.component(.second, from: Date())))
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimers + Calendar.current.component(.minute, from: Date()) - 1) * 60 + (60 - secondTimers + Calendar.current.component(.second, from: Date())))
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
            }
        }
    }
}

struct StudyTimerView: View {
    @AppStorage("hourTimerss") var hourTimerss: Int = 0
    @AppStorage("minuteTimerss") var minuteTimerss: Int = 0
    @AppStorage("secondTimerss") var secondTimerss: Int = 0
    @State private var blink: Int = 0
    @State private var timeElapsed: Double = 0.0
    @State private var isRunning: Bool = false
    @Binding var dailyStudyDone: Int
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarnedByStudy: Double
    var name: String
    var color: Color
    private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
    var body: some View {
        let hours = Int(timeElapsed / 3600)
        let minutes = Int((timeElapsed.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeElapsed.truncatingRemainder(dividingBy: 60))
        HStack {
            Text(name)
                .bold()
                .foregroundColor(blink == 0 ? color : (blink == 1 ? .green : .black))
            Divider()
            Spacer()
            if isRunning {
                Button(action: {
                    timeElapsed = 0
                    isRunning = false
                    blink = 2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        blink = 0
                    }
                }) {
                    Text("Delete")
                }
                .buttonStyle(.borderless)
            }
            Text(String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds))
                .fontWeight(isRunning ? .bold : .regular)
            if !isRunning {
                Button(action: {
                    hourTimerss = Calendar.current.component(.hour, from: Date())
                    minuteTimerss = Calendar.current.component(.minute, from: Date())
                    secondTimerss = Calendar.current.component(.second, from: Date())
                    isRunning.toggle()
                }) {
                    Image(systemName: "play.circle.fill")
                }
                .buttonStyle(.borderless)            }
            if isRunning {
                Button(action: {
                    dailyStudyDone += Int(timeElapsed / 60)
                    moneyEarnedToday += Double(Int(timeElapsed / 60)) * moneyEarnedByStudy / 60
                    moneyEarned += Double(Int(timeElapsed / 60)) * moneyEarnedByStudy / 60
                    blink = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        blink = 0
                    }
                    timeElapsed = 0
                    isRunning = false
                }) {
                    Image(systemName: "stop.circle.fill")
                }
                .buttonStyle(.borderless)
            }
        }
        .onReceive(timer) {_ in
            if isRunning {
                let secondsDifference = Calendar.current.component(.second, from: Date()) - secondTimerss
                let minutesDifference = Calendar.current.component(.minute, from: Date()) - minuteTimerss
                let hourDifference = Calendar.current.component(.hour, from: Date()) - hourTimerss
                if secondsDifference > 0 {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + minutesDifference * 60 + secondsDifference)
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimerss + Calendar.current.component(.minute, from: Date())) * 60 + secondsDifference)
                    }
                } else {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + (minutesDifference - 1) * 60 + (60 - secondTimerss + Calendar.current.component(.second, from: Date())))
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimerss + Calendar.current.component(.minute, from: Date()) - 1) * 60 + (60 - secondTimerss + Calendar.current.component(.second, from: Date())))
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
            }
        }
    }
}
*/

import SwiftUI
import Combine

class TimerManager: ObservableObject {
    @Published var timeElapsed: TimeInterval = 0
    @Published var isRunning: Bool = false
    private var startTime: Date?
    private var timerSubscription: AnyCancellable?

    func startTimer() {
        startTime = Date()
        isRunning = true
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, let start = self.startTime else { return }
                self.timeElapsed = Date().timeIntervalSince(start)
            }
    }

    func stopTimer() {
        isRunning = false
        timerSubscription?.cancel()
        timerSubscription = nil
    }

    func resetTimer() {
        stopTimer()
        timeElapsed = 0
        startTime = nil
    }
}

struct YogaTimerView: View {
    @StateObject private var timerManager = TimerManager()
    @Binding var dailyYogaDone: Bool
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarnedByYoga: Double

    var numberOfMinutes: Int
    var name: String
    var color: Color

    @State private var blinkColor: Color = .black

    var body: some View {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(Int(timerManager.timeElapsed))

        HStack {
            Text(name)
                .bold()
                .foregroundColor(blinkColor)
            Spacer()
            Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                .fontWeight(timerManager.isRunning ? .bold : .regular)
            if !timerManager.isRunning {
                Button(action: startYoga) {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.green)
                }
                .buttonStyle(.borderless)
            }
            if timerManager.isRunning {
                Button(action: stopYoga) {
                    Image(systemName: "stop.circle.fill")
                        .foregroundColor(.red)
                }
                .buttonStyle(.borderless)
                Button(action: timerManager.resetTimer) {
                    Image(systemName: "trash.circle.fill")
                        .foregroundColor(.orange)
                }
                .buttonStyle(.borderless)
            }
        }
    }

    private func startYoga() {
        timerManager.startTimer()
        blinkColor = color
    }

    private func stopYoga() {
        if Int(timerManager.timeElapsed / 60) >= numberOfMinutes {
            dailyYogaDone = true
            moneyEarned += moneyEarnedByYoga
            moneyEarnedToday += moneyEarnedByYoga
        }
        blinkColor = .green
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            blinkColor = .black
        }
        timerManager.resetTimer()
    }

    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, seconds % 60)
    }
}

struct StudyTimerView: View {
    @StateObject private var timerManager = TimerManager()
    @Binding var dailyStudyDone: Int
    @Binding var moneyEarned: Double
    @Binding var moneyEarnedToday: Double
    @Binding var moneyEarnedByStudy: Double

    var name: String
    var color: Color

    @State private var blinkColor: Color = .black

    var body: some View {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(Int(timerManager.timeElapsed))

        HStack {
            Text(name)
                .bold()
                .foregroundColor(blinkColor)
            Spacer()
            Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                .fontWeight(timerManager.isRunning ? .bold : .regular)
            if !timerManager.isRunning {
                Button(action: startStudy) {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.green)
                }
                .buttonStyle(.borderless)
            }
            if timerManager.isRunning {
                Button(action: stopStudy) {
                    Image(systemName: "stop.circle.fill")
                        .foregroundColor(.red)
                }
                .buttonStyle(.borderless)
                Button(action: timerManager.resetTimer) {
                    Image(systemName: "trash.circle.fill")
                        .foregroundColor(.orange)
                }
                .buttonStyle(.borderless)
            }
        }
    }

    private func startStudy() {
        timerManager.startTimer()
        blinkColor = color
    }

    private func stopStudy() {
        let minutesStudied = Int(timerManager.timeElapsed / 60)
        dailyStudyDone += minutesStudied
        let earned = Double(minutesStudied) * moneyEarnedByStudy / 60
        moneyEarnedToday += earned
        moneyEarned += earned

        blinkColor = .green
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            blinkColor = .black
        }
        timerManager.resetTimer()
    }

    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, seconds % 60)
    }
}
