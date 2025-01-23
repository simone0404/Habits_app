import SwiftUI

struct ToolbarTitle: ViewModifier {
    let titleDisplayed: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(titleDisplayed)
                        .font(.title)
                        .bold()
                }
            }
    }
}

extension View {
    func toolbarTitle(_ title: String) -> some View {
        self.modifier(ToolbarTitle(titleDisplayed: title))
    }
}

