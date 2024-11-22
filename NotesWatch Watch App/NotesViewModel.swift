import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []

    init() {
        loadNotes()  // Load notes when the app starts
    }

    // Adds a new note and saves the updated list
    func addNote(content: String) {
        let newNote = Note(content: content)
        notes.append(newNote)
        saveNotes()  // Save after adding a note
    }

    // Deletes a note and saves the updated list
    func deleteNote(at indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
        saveNotes()  // Save after deleting a note
    }

    // Updates an existing note and saves the updated list
    func updateNote(note: Note, newContent: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].content = newContent
            saveNotes()  // Save after updating a note
        }
    }

    // Save the notes array to UserDefaults
    private func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "Notes")
        }
    }

    // Load the notes array from UserDefaults
    private func loadNotes() {
        if let savedData = UserDefaults.standard.data(forKey: "Notes"),
           let decodedNotes = try? JSONDecoder().decode([Note].self, from: savedData) {
            self.notes = decodedNotes
        }
    }
}
