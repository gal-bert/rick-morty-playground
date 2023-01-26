import Foundation

struct RMCharacterCollection: Codable {
    var info: RMInfo
    var results: [RMCharacter]
}

struct RMInfo: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct RMCharacter: Codable {
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: RMOrigin
    var location: RMLocation
}

struct RMOrigin: Codable {
    var name: String
}

struct RMLocation: Codable {
    var name: String
}

var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/?name=rick&status=alive")!)

URLSession.shared.dataTask(with: request) { data, response, error in
    let result = try! JSONDecoder().decode(RMCharacterCollection.self, from: data!)
    
    print("Count", result.info.count)
    print("Pages", result.info.pages)
    print()
    
    for character in result.results {
        print("Name", character.name)
        print("Origin", character.origin.name)
        print()
    }
    
}.resume()

