import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var isPresentingAddNote = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    ForEach(viewModel.notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel)) {
                            Text(note.content)
                                .lineLimit(2)
                        }
                    }
                    .onDelete(perform: viewModel.deleteNote)
                }
                .listStyle(CarouselListStyle())
                .frame(height: geometry.size.height * 0.99) // Adjust the list height dynamically based on screen size
                
                Spacer() // This ensures the button remains at the bottom

                Button {
                    isPresentingAddNote = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 30, weight: .semibold))
                }
                .sheet(isPresented: $isPresentingAddNote) {
                    AddNoteView(viewModel: viewModel)
                }
                .background(Color.blue.opacity(0.5))
//                .frame(width: 150, height: 40)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
                .padding(.bottom, geometry.safeAreaInsets.bottom) // Respect safe area
            }
            //.edgesIgnoringSafeArea(.bottom) // Ensure button is flush to the screen's bottom edge
        }
        .navigationTitle("Notes")
    }
        
}
