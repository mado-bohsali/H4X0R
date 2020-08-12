//
//  Results.swift
//  H4X0R
//
//  Created by Mohamad El Bohsaly on 4/4/20.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    //computed property
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
