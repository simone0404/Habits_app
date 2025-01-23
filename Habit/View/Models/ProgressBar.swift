import SwiftUI

struct barColor: ProgressViewStyle {
    let color: Color
    init(color: Color) {
        self.color = color
    }
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(color)
    }
}

struct ProgressBar: View {
    @Binding var actualValue: Double
    @Binding var totalValue: Double
    @State var color: Color
    var body: some View {
        HStack {
            Text("Progress ")
            ProgressView(value: actualValue, total: totalValue)
                .progressViewStyle(barColor(color: color))
        }

    }
}

struct ProgressBarInt: View {
    @Binding var actualValue: Int
    var totalValue: Int
    @State var color: Color
    var body: some View {
        HStack {
            Text("Progress ")
            ProgressView(value: Double(actualValue), total: Double(totalValue))
                .progressViewStyle(barColor(color: color))
        }

    }
}
