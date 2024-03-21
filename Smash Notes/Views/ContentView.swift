import SwiftUI


struct ContentView: View {
    @State private var notes: [Note] = []
    @State private var showingQuitConfirmationModal = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if notes.isEmpty {
                    Text("Create some notes")
                } else {
                    List {
                        ForEach(notes, id: \.id) { note in
                            NavigationLink(destination: NoteView(notes: $notes, noteBody: note, editing: true)) {
                                NoteRow(note: note)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            notes.remove(atOffsets: indexSet)
                            PersistenceController().saveNotes()
                        })
                    }
                }
            }
            .frame(alignment: .leading)
            .navigationTitle(Text("Smash Notes"))
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: NoteView(notes: $notes)) {
                        HStack{
                            Image(systemName: "plus")
                        }
                    }
                }

            }
            
        }
        .onAppear {
            notes = PersistenceController().loadNotes()
        }
    }
       
}
