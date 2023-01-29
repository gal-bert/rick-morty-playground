import Foundation

let endpoint = "https://rickandmortyapi.com/api/character/1"
let url = URL(string: endpoint)

var request: URLRequest

if let url = url {
    
    request = URLRequest(url: url)
    
    var task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let data = data {
            do{
                let character = try! JSONSerialization.jsonObject(with: data) as! [String:Any]
                print(character["name"] as! String)
                print(character["status"] as! String)
                
                let location = character["location"] as! [String:Any]
                print(location["name"] as! String)
                
                for episode in (character["episode"] as! [String]) {
                    print(episode)
                }
                
            } catch {
                print("JSON Serialization error:", error.localizedDescription)
            }
        } else {
            print("Data error:", error!.localizedDescription)
        }
    }
    
    task.resume()
    
}

