
import SwiftUI

struct NoteView: View {
  @State var isToogleOn = false
  @Binding var notes: [Note]
  @State var noteBody = Note()
  @State var showingMainsSheet = false
  @State var showingStagesSheet = false
  @State var showSaveBtn = false
  @Environment(\.presentationMode) var presentationMode
  var editing = false
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    private var mainsArray: [String]? {
        get {
            return noteBody.mains?.allObjects as? [String]
        }
        set {
            noteBody.mains = NSSet(array: newValue ?? [])
        }
    }
    
    private var stagesArray: [String]? {
        get {
            return noteBody.stagesToBan?.allObjects as? [String]
        }
        set {
            noteBody.stagesToBan = NSSet(array: newValue ?? [])
        }
    }

   
  private func hasNoteChanged() -> Bool {
    let currentNote = notes.first(where: { $0.id == noteBody.id})
     
    if currentNote != noteBody && editing {
      return true
    } else if noteBody.playerName != "" && !editing {
      return true
    } else {
      return false
    }
  }
   
  private func handleSave() {
      if editing {
      // Add note
      }
      else {
        // Add Note
      }
  }

   
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          TextField(
            "Player name",
            text: $noteBody.playerName
          )
          .font(Font.system(size: 30, design: .default))
          .disableAutocorrection(true)
          HStack {
              Selectables(title: "Mains", selecteds: mainsArray, listOptions: characters, limit: 5, searchable: true, hasIcon: true)
            Spacer()
            Divider()
            Spacer()
            Selectables(title: "Stages to ban", selecteds: stagesArray, listOptions: stages, limit: 5, circularShape: true, sectionHeader: "Ultimate", secondSectionHeader: "Melee", secondListOptions: meleeStages)
          }
//          HabitsList(habits: $noteBody.habits)
          Detail(title: "Win condition", inputValue: $noteBody.winCondition, inputPlaceholder: "Describe here your opponent's win condition")
          Detail(title: "Other", inputValue: $noteBody.extraDetails, inputPlaceholder: "Write here anything you'd like to remember")
          Spacer()
        }
        .onReceive(timer) { time in
          if hasNoteChanged() {
            showSaveBtn = true
          } else {
            showSaveBtn = false
          }
        }
        .toolbar {
          ToolbarItemGroup(placement: .topBarTrailing) {
              if showSaveBtn {
                Button(action: {
                  handleSave()
                  self.presentationMode.wrappedValue.dismiss()
                }) {
                  HStack {
                    Image(systemName: "checkmark")
                    Text("Save changes")
                  }
                }
              }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
      }
    }
    }
  }

struct SheetView<Content: View>: View {
  @ViewBuilder let content: Content
   
  var body: some View {
    content
  }
} 
