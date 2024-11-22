import SwiftUI

struct NoteDetailView: View {
    var note: Note
    @ObservedObject var viewModel: NotesViewModel
    @State private var isPresentingEditNote = false

    var body: some View {
        VStack {
            Text(note.content)
                .padding()

            // Button to edit the note
            Button("Edit") {
                isPresentingEditNote = true
            }
            .sheet(isPresented: $isPresentingEditNote) {
                EditNoteView(viewModel: viewModel, note: note)
            }
        }
        .navigationTitle("Note")
    }
}
