import Foundation

struct RMCharacter: Codable {
    var name: String
    var status: String
    var episode: [String]
    var origin: RMOrigin
}

struct RMOrigin: Codable {
    var name: String
    var url: String
}

let endpoint = "https://rickandmortyapi.com/api/character/1,2,3,4"
let url = URL(string: endpoint)

var request: URLRequest

if let url = url {
    
    request = URLRequest(url: url)
    
    var task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let data = data {
            do{
                let characters = try JSONDecoder().decode([RMCharacter].self, from: data)
                for character in characters {
                    print(character.name)
                    print(character.origin.name)
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
