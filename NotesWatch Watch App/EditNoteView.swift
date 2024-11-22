import SwiftUI

struct EditNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
    var note: Note
    @State private var newContent: String
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: NotesViewModel, note: Note) {
        self.viewModel = viewModel
        self.note = note
        _newContent = State(initialValue: note.content)
    }

    var body: some View {
        VStack {
            TextField("Edit note", text: $newContent)

            // Button to save the edited note
            Button("Save") {
                if !newContent.isEmpty {
                    viewModel.updateNote(note: note, newContent: newContent)
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }
            }
        }
        .navigationTitle("Edit Note")
        .padding()
    }
}
