//
//  HabitRow.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 7/11/23.
//

import SwiftUI

struct HabitRow: View {
    @Binding var habit: Habit
    @Binding var habits: [Habit]
    @FocusState private var isFocused: Bool
    @State var showingHabitTypesSheet = false
    @State private var selection: String?
    
    var body: some View {
        HStack {
            TextField("Write a habit", text: $habit.text, axis: .vertical)
                .frame( minHeight: 20)
                .font(Font.system(size: 20, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Button(action: {
                showingHabitTypesSheet = true
            }) {
                switch habit.habitType?.text {
                    case "Advantage":
                        Image(systemName: "arrowshape.up")
                            .foregroundStyle(.green)
                    case "Disadvantage":
                        Image(systemName: "arrowshape.down")
                            .foregroundStyle(.orange)
                    case "Neutral":
                        Image(systemName: "arrowshape.left.arrowshape.right")
                            .foregroundStyle(.green)
                    case "Under pressure":
                        Image(systemName: "gauge.with.needle.fill")
                            .foregroundStyle(.green)
                    default:
                        Text("Type")
                            .foregroundStyle(.blue)
                }
            }
            Image(systemName: "trash")
                .onTapGesture {
                    habits.removeAll(where: {$0.id == habit.id})
                }
        }
        .padding(4)
        Divider()
    }
}
