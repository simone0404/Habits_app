import SwiftUI

struct SuggestedFruitView: View {
    var month = Calendar.current.component(.month, from: Date())
    var bigArray: [(months: [Int], name: String)] = [
        ([1,2,3,4,5,9,10,11,12], "Apple"),
        ([1,2,3,4,5,6,7,8,9,10,11,12], "Banana"),
        ([8,9,10,11,12], "Grape"),
        ([11,12,1,2,3,4], "Orange"),
        ([7,8], "Raspberries"),
        ([7,8], "Blueberries"),
        ([1,2,11,12], "Tangerine"),
        ([1,8,9,10,11,12], "Pear"),
        ([1,2,3,4,11,12], "Kiwi"),
        ([4,5,6], "Strawberries"),
        ([6,7,8], "Peach"),
        ([6,7,8], "Melon"),
        ([5,6,7], "Apricot"),
        ([1,2,3,4,5,6,7,8,9,10,11,12], "Avocado"),
        ([8,9,10,11], "Plum"),
        ([10,11,12,1,2,3,4,5], "Ananas"),
        ([7,8], "Watermelon")
    ]
    var body: some View {
        ForEach(0..<bigArray.count, id: \.self) { index in
            if bigArray[index].months.contains(month){
                Text(bigArray[index].name)
            }
        }
    }
}

struct SuggestedFruitView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedFruitView()
    }
}
