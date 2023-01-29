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

let endpoint = "https://rickandmortyapi.com/api/character/?name=rick&status=alive"
let url = URL(string: endpoint)

var request: URLRequest

if let url = url {
    
    request = URLRequest(url: url)
    
    var task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let data = data {
            do{
                let result = try JSONDecoder().decode(RMCharacterCollection.self, from: data)
                
                print("Count:", result.info.count)
                print("Pages:", result.info.pages)
                print()
            
                for character in result.results {
                    print("Name:", character.name)
                    print("Origin:", character.origin.name)
                    print()
                }
                
            } catch {
                print("JSON Decoder error:", error.localizedDescription)
            }
        } else {
            print("Data error:", error!.localizedDescription)
        }
    }
    
    task.resume()
    
}

