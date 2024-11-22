import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    var content: String
    
    init(content: String) {
        self.id = UUID()
        self.content = content
    }
}
