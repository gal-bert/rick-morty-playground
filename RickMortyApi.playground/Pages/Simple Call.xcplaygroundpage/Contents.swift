import Foundation

var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/2")!)

URLSession.shared.dataTask(with: request) { data, response, error in
    let character = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
    print(character["name"] as! String)
    print(character["status"] as! String)
    print(character["episode"]as! [String])
}.resume()




