//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Mohamad El Bohsaly on 4/4/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    //Observer Pattern - A type that publishes a property marked with an attribute.
    @Published var posts = [Post]()
    
    func fetchData() -> Void {
        //All stories that are on the front/home page right now
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: {data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let results = try decoder.decode(Results.self, from: data)
                            
                            //Main thread
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            })
            
            task.resume()
        }
    }
}
