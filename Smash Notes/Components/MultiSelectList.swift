import SwiftUI

struct MultiSelectList: View {
    @State var items: [String]
    @Binding var selections: [String]
    @State var hasIcon: Bool = false
    @State var limitNumber = 10
    var searchable: Bool
    var searchPlaceholder: String = ""
    @State var searchText = ""
    var sectionHeader = ""
    var secondSectionHeader = ""
    @State var secondSectionItems: [String]

    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            if searchable {
                TextField(searchPlaceholder, text: $searchText)
                    .frame(height: 20)
                    .font(Font.system(size: 20, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .disableAutocorrection(true)
            }
            List {
                Section(header: Text(sectionHeader)) {
                    ForEach(filteredItems, id: \.self) { item in // Use filteredItems
                        MultiSelectRow(title: item, isSelected: self.selections.contains(item), action:  {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            } else if self.selections.count < limitNumber {
                                self.selections.append(item)
                            }
                        }, hasIcon: self.hasIcon)
                    }
                }
                Section(header: Text(secondSectionHeader)) {
                    ForEach(secondSectionItems, id: \.self) { item in
                        MultiSelectRow(title: item, isSelected: self.selections.contains(item), action:  {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            } else if self.selections.count < limitNumber {
                                self.selections.append(item)
                            }
                        }, hasIcon: self.hasIcon)
                    }
                }
            }
        }
    }
}
