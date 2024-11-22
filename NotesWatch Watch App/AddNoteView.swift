import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
    @State private var noteContent: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Enter note", text: $noteContent)

            // Button to save the new note
            Button("Save") {
                if !noteContent.isEmpty {
                    viewModel.addNote(content: noteContent)
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }
            }
        }
        .navigationTitle("New Note")
        .padding()
    }
}
