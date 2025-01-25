/* import SwiftUI

struct ActivityTimerView: View {
    @AppStorage("hourTimer") var hourTimer: Int = 0
    @AppStorage("minuteTimer") var minuteTimer: Int = 0
    @AppStorage("secondTimer") var secondTimer: Int = 0
    @State private var blink: Int = 0
    @State private var timeElapsed: Double = 0.0
    @State private var isRunning: Bool = false
    @Binding var activityMinutes: Double
    @Binding var dailyActivityDone: Double
    var name: String
    private let timer = Timer.publish(every: 1, on: RunLoop.main, in: .common).autoconnect()
    var body: some View {
        let hours = Int(timeElapsed / 3600)
        let minutes = Int((timeElapsed.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeElapsed.truncatingRemainder(dividingBy: 60))
        HStack {
            Text(name)
                .bold()
                .frame(width: CGFloat(50))
                .foregroundColor(blink == 0 ? .red : (blink == 1 ? .green : .black))
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
                    hourTimer = Calendar.current.component(.hour, from: Date())
                    minuteTimer = Calendar.current.component(.minute, from: Date())
                    secondTimer = Calendar.current.component(.second, from: Date())
                    isRunning.toggle()
                }) {
                    Image(systemName: "play.circle.fill")
                }
                .buttonStyle(.borderless)            }
            if isRunning {
                Button(action: {
                    activityMinutes += Double(Int(timeElapsed / 60))
                    dailyActivityDone += Double(Int(timeElapsed / 60))
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
                let secondsDifference = Calendar.current.component(.second, from: Date()) - secondTimer
                let minutesDifference = Calendar.current.component(.minute, from: Date()) - minuteTimer
                let hourDifference = Calendar.current.component(.hour, from: Date()) - hourTimer
                if secondsDifference > 0 {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + minutesDifference * 60 + secondsDifference)
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimer + Calendar.current.component(.minute, from: Date())) * 60 + secondsDifference)
                    }
                } else {
                    if minutesDifference > 0 {
                        timeElapsed = Double(hourDifference * 3600 + (minutesDifference - 1) * 60 + (60 - secondTimer + Calendar.current.component(.second, from: Date())))
                    } else {
                        timeElapsed = Double((hourDifference - 1) * 3600 + (60 - minuteTimer + Calendar.current.component(.minute, from: Date()) - 1) * 60 + (60 - secondTimer + Calendar.current.component(.second, from: Date())))
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
            }
        }
    }
}

struct ActivityTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTimerView(activityMinutes: .constant(0.0), dailyActivityDone: .constant(0.0), name: "activity")
    }
}

*/

import SwiftUI

struct ActivityTimerView: View {
    @State private var startTime: Date? = nil // Track when the timer starts
    @State private var timeElapsed: TimeInterval = 0 // Total elapsed time in seconds
    @State private var isRunning: Bool = false
    @State private var blinkColor: Color = .black

    @Binding var activityMinutes: Double
    @Binding var dailyActivityDone: Double
    var name: String

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(Int(timeElapsed))

        HStack {
            // Activity name with blinking color
            Text(name)
                .bold()
                .frame(width: 100)
                .foregroundColor(blinkColor)

            Spacer()

            // Timer display
            Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                .fontWeight(isRunning ? .bold : .regular)

            // Start button
            if !isRunning {
                Button(action: startTimer) {
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.green)
                }
                .buttonStyle(.borderless)
            }

            // Stop button
            if isRunning {
                Button(action: stopTimer) {
                    Image(systemName: "stop.circle.fill")
                        .foregroundColor(.red)
                }
                .buttonStyle(.borderless)
            }

            // Reset button
            if isRunning {
                Button(action: resetTimer) {
                    Image(systemName: "trash.circle.fill")
                        .foregroundColor(.orange)
                }
                .buttonStyle(.borderless)
            }
        }
        .onReceive(timer) { _ in
            updateTimeElapsed()
        }
    }

    // MARK: - Helper Functions

    private func startTimer() {
        startTime = Date()
        isRunning = true
        blinkColor = .red
    }

    private func stopTimer() {
        if let start = startTime {
            timeElapsed += Date().timeIntervalSince(start)
        }
        startTime = nil
        isRunning = false

        // Update activity and daily progress
        let minutesElapsed = timeElapsed / 60
        activityMinutes += minutesElapsed
        dailyActivityDone += minutesElapsed

        blinkColor = .green
        resetBlinkColor()
    }

    private func resetTimer() {
        timeElapsed = 0
        startTime = nil
        isRunning = false
        blinkColor = .orange
        resetBlinkColor()
    }

    private func updateTimeElapsed() {
        if isRunning, let start = startTime {
            timeElapsed = Date().timeIntervalSince(start)
        }
    }

    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, seconds % 60)
    }

    private func resetBlinkColor() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            blinkColor = .black
        }
    }
}

struct ActivityTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTimerView(
            activityMinutes: .constant(0.0),
            dailyActivityDone: .constant(0.0),
            name: "Activity"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
