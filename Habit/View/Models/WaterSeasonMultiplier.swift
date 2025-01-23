import Foundation

func waterSeasonMultiplier() -> Double {
    var waterSeasonMultiplier = 1.0
    let currentMonth = Calendar.current.component(.month, from: Date())
    if currentMonth == 6 || currentMonth == 7 || currentMonth == 8 {
        waterSeasonMultiplier = 1.2
    }
    return waterSeasonMultiplier
}
