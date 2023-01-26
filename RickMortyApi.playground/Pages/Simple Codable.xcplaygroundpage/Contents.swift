import Foundation

struct RMCharacter: Codable {
    var name: String
    var status: String
    var episode: [String]
}

var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/2")!)

URLSession.shared.dataTask(with: request) { data, response, error in
    let character = try! JSONDecoder().decode(RMCharacter.self, from: data!)
    print(character.name)
    print(character.status)
    print(character.episode)
}.resume()



