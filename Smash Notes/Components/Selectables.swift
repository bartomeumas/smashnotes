import SwiftUI

struct Selectables: View {
    var title: LocalizedStringKey
    var selecteds: [String]?
    var listOptions: [String]
    var limit: Int = 10
    var searchable = false
    var searchPlaceholder: String = "Search"
    var hasIcon = false
    let columns = [GridItem(.adaptive(minimum: 40))]
    var circularShape = false
    var sectionHeader = ""
    var secondSectionHeader = ""
    var secondListOptions = [String]()

    @State private var selectedStrings: [String]
    
    init(title: LocalizedStringKey, selecteds: [String]?, listOptions: [String], limit: Int = 10, searchable: Bool = false, searchPlaceholder: String = "Search", hasIcon: Bool = false, circularShape: Bool = false, sectionHeader: String = "", secondSectionHeader: String = "", secondListOptions: [String] = []) {
        self.title = title
        self.selecteds = selecteds
        self.listOptions = listOptions
        self.limit = limit
        self.searchable = searchable
        self.searchPlaceholder = searchPlaceholder
        self.hasIcon = hasIcon
        self.circularShape = circularShape
        self.sectionHeader = sectionHeader
        self.secondSectionHeader = secondSectionHeader
        self.secondListOptions = secondListOptions
        _selectedStrings = State(initialValue: selecteds ?? [])
    }
    
    var body: some View {
        VStack {
            Text(title)
            LazyVGrid(columns: columns) {
                ForEach(selectedStrings, id: \.self) { selected in
                    if circularShape {
                        Image(selected)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .onTapGesture {
                                toggleSelection(selected)
                            }
                    } else {
                        Image(selected)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                toggleSelection(selected)
                            }
                    }
                }
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .onTapGesture {
                        // Show sheet or perform other action here
                    }
            }
            Spacer()
        }
    }
    
    private func toggleSelection(_ selected: String) {
        if selectedStrings.contains(selected) {
            selectedStrings.removeAll { $0 == selected }
        } else {
            selectedStrings.append(selected)
        }
    }
}
