import SwiftUI

struct captionView: View {
    var number: Int
    var string: String
    var body: some View {
        HStack (spacing: 5){
            Text("\(number). ")
            Divider()
            Text(string)
        }
        .font(.system(size: 10))
        .font(.footnote)
        .frame(alignment: .leading)
        .lineSpacing(-20)
        .foregroundColor(.gray)
    }
}

struct captionView_Previews: PreviewProvider {
    static var previews: some View {
        captionView(number: 1, string: "The value of water to drink is calculated using this formula: \n 10(weight+height)*season where season = 1.2 in summer and 1.0 in other seasons")
    }
}
