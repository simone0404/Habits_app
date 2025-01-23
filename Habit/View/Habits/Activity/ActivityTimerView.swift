 import SwiftUI

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
