//
//  JokeModel.swift
//  QdaJokester
//
//  Created by Q B on 9/30/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import Foundation

struct Joke: Decodable {
    let type: String
    let setup: String
    let punchline: String
}
