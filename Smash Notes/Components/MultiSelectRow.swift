import SwiftUI

struct MultiSelectRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var hasIcon: Bool = false

    var body: some View {
        Button(action: self.action) {
            HStack {
                HStack {
                    Text(self.title)
                    if hasIcon {
                        Image(title)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
        .foregroundStyle(.black)
    }
}
