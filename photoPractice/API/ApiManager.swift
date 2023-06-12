//
//  ApiManager.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class ApiManager {
    static let shared = ApiManager()
    static func generateURLComponents(url: String?, items: [URLQueryItem]) -> URL? {
        var urlComponents = URLComponents(string: url ?? "")
        urlComponents?.queryItems = items
        return urlComponents?.url
    }
    private init() {}
}

extension ApiManager: ApiManagerProtocol {
    func getRandomPhoto(completion: @escaping (_ photos: AllPhotos) -> Void) {
        var request = ApiType.getRandomPhotos.request
        request.url = ApiManager.generateURLComponents(url: request.url?.absoluteString,
                                                       items: [URLQueryItem(name: "count", value: "\(15)")])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let castResponse = response as? HTTPURLResponse,
                  castResponse.statusCode == 200,
                  let data = data else { return }
            guard let photos = try? JSONDecoder().decode(AllPhotos.self, from: data) else { return }
            completion(photos)
        }
    }
    
    func getSearchPhoto(search: String?, completion: @escaping (_ photos: AllPhotos)  -> Void) {
        var request = ApiType.getSearchPhotos.request
        request.url = ApiManager.generateURLComponents(url: request.url?.absoluteString,
                                                       items: [URLQueryItem(name: "query", value: search)])
        print(request.url) // TODO: remove
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let castResponse = response as? HTTPURLResponse,
                  castResponse.statusCode == 200 else { return }
            
        }
        task.resume()
    }
    
    
}
