//
//  PodcastRequest.swift
//  ArabamAssignment
//
//  Created by Muhammed Karakul on 11.01.2022.
//

import Foundation

struct Request: DataRequest {
    
    var searchText: String
    
    var media: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : media]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String,media: String) {
        self.searchText = searchText
        self.media = media
    }
    
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(Response.self, from: data)
        return response
    }
}
