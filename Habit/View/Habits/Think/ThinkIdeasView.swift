import SwiftUI

struct ThinkIdeasView: View {
    @Binding var idea: String
    var body: some View {
        HStack {
            TextField("...", text: $idea)
                .keyboardType(.default)
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
                .lineLimit(nil)
            Spacer()
            Divider()
            Button(action: {
                idea = ""
            }) {
                Image(systemName: "xmark.circle.fill")
            }
            .buttonStyle(.borderless)
        }
    }
}

struct ThinkIdeasView_Previews: PreviewProvider {
    static var previews: some View {
        ThinkIdeasView(idea: .constant("ciao"))
    }
}
