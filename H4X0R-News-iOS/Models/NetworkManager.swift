//
//  NetworkManager.swift
//  H4X0R-News-iOS
//
//  Created by Harting, R.P.G. (Rob) on 23/09/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    
    // Publish via @Published
    @Published var posts = [Post]()
    
    func fetchData() {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // must happen on main thread due to the @Published and not in background
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            self.posts = results.hits
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
