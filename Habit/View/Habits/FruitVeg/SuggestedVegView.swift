import SwiftUI

struct SuggestedVegView: View {
    var month = Calendar.current.component(.month, from: Date())
    var bigArray: [(months: [Int], name: String)] = [
        ([6,7,8,9], "Potato"),
        ([6,7,8,9,10], "Salad"),
        ([8,9,10,11,12], "Zucchini"),
        ([6,7,8,9], "Pepper"),
        ([3,4,5,6,7,9,10,11], "Carot"),
        ([1,2,3,10,11,12], "Spincach"),
        ([7,8,9,10], "Aubergine"),
        ([4,5,6,7], "Green Beans"),
        ([5,6], "Peas"),
        ([1,2,3,9,10,11,12], "Broccoli"),
        ([1,2,3,9,10,11,12], "Cauliflower"),
        ([4,5,6], "Asparagus"),
        ([9,10,11], "Pumpkin"),
        ([1,2,3,4,5,6,7,8,9,10,11,12], "Potatoes"),
        ([1,2,9,10,11,12], "Leeks")
    ]
    var body: some View {
        ForEach(0..<bigArray.count, id: \.self) { index in
            if bigArray[index].months.contains(month){
                Text(bigArray[index].name)
            }
        }
    }
}

struct SuggestedVegView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedVegView()
    }
}
