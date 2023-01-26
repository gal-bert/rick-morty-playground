import Foundation

struct RMCharacter: Codable {
    var name: String
    var status: String
    var episode: [String]
    var origin: Origin
}

struct RMOrigin: Codable {
    var name: String
    var url: String
}

var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4")!)

URLSession.shared.dataTask(with: request) { data, response, error in
    let characters = try! JSONDecoder().decode([RMCharacter].self, from: data!)
    for character in characters {
        print(character.name)
        print(character.origin.name)
        print()
    }
        
}.resume()
