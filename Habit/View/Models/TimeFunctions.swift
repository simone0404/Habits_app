import Foundation

func daysBetweenDates(endDate: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: Date(), to: endDate)
    return components.day ?? 0
}
