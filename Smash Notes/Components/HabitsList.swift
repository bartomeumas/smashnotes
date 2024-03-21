//
//  HabitsList.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 7/11/23.
//

import SwiftUI

struct HabitsList: View {
    @Binding var habits: [Habit]
    
    private func addHabit() {
        if (habits.last?.text != "") {
            habits.append(Habit())
        }
    }
    
    var body: some View {
            HStack {
            Text("Habits")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            Spacer()
            Image(systemName: "plus")
                    .onTapGesture {
                        addHabit()
                    }
            }
        VStack {
            if habits.isEmpty {
                Text("Add new habits!")
            }
            else {
                ForEach(self.$habits, id: \.id) { habit in
                    HabitRow(habit: habit, habits: $habits)
                }
            }
        }
        .frame(minHeight:60)
    }
}
