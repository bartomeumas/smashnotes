import SwiftUI

struct Detail: View {
  var title: LocalizedStringKey
  @Binding var inputValue: String
  var inputPlaceholder: LocalizedStringKey
   
  var body: some View {
    Text(title)
      .frame(maxWidth: .infinity, alignment: .leading)
      .font(.title)
    TextField(
      inputPlaceholder,
      text: $inputValue,
      axis: .vertical
    )
    .lineLimit(6)
    .font(Font.system(size: 16, design: .default))
    .disableAutocorrection(true)
  }
}
