import Foundation

struct RMCharacter: Codable {
    var name: String
    var status: String
    var episode: [String]
}

let endpoint = "https://rickandmortyapi.com/api/character/1"
let url = URL(string: endpoint)

var request: URLRequest

if let url = url {
    
    request = URLRequest(url: url)
    
    var task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let data = data {
            do{
                let character = try JSONDecoder().decode(RMCharacter.self, from: data)
                print(character.name)
                print(character.status)
                
                for episode in character.episode {
                    print(episode)
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



