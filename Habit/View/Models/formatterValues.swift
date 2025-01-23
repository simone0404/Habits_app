import Foundation

func formattedValue(_ value: Double) -> String {
        let formattedString: String
        
        if value.truncatingRemainder(dividingBy: 1) != 0 {
            formattedString = String(format: "%.2f", value)
        } else {
            formattedString = String(Int(value))
        }
        
        return formattedString
    }
