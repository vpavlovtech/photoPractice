//
//  ApiType.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

private enum HTTPMethod: String {
    case POST
    case GET
    case DELETE
    case PUT
}
enum ApiType {
    case getRandomPhotos
    case getSearchPhotos
    
    var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var path: String {
        switch self {
        case .getRandomPhotos:
            return "photos/random"
        case .getSearchPhotos:
            return "search/photos"
        }
    }
    var method: String {
        switch self {
        case    .getRandomPhotos,
                .getSearchPhotos:
            return HTTPMethod.GET.rawValue
        }
    }
    var headers: [String : String] {
        return ["Authorization" : "Client-ID hud3fWtg5TGYKy8Szo4uZU8C5mloK1vkyPQkhas07wo"]
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL))!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
