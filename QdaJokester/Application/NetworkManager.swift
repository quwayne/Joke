//
//  NetworkManager.swift
//  QdaJokester
//
//  Created by Q B on 9/28/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import Foundation

enum NetError: Error {
    case error
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    private init() {}
    
    
    func getRandomJoke(completion: @escaping (Result<Joke,NetError>) -> Void) {
        
        let endpoint = "https://official-joke-api.appspot.com/jokes/random"
        
        guard let url = URL(string: endpoint) else { completion(.failure(.error)) ; return }
        
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
            
            guard let data = data else { completion(.failure(.error)) ; return }
            
            guard  (response as? HTTPURLResponse) != nil else {
                completion(.failure(.error))
                return
            }
            
            if let _ = error { completion(.failure(.error)) }
            
            do {
                let decoder = JSONDecoder()
                let joke = try decoder.decode(Joke.self, from: data)
                completion(.success(joke))
            } catch {
                completion(.failure(.error))
            }
            
        }
        task.resume()
    }
    
}
