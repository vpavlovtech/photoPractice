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
    static func decodeData<T:Decodable>(decodeType: T.Type, from data: Data?) -> T? {
        guard let data = data else { return nil }
        do {
            let objects = try JSONDecoder().decode(decodeType.self, from: data)
            return objects
        }
        catch {
            print("Parsing error \(error)")
            return nil
        }
    }
    private init() {}
}

extension ApiManager: ApiManagerProtocol {
    func getRandomPhoto(completion: @escaping (_ photos: AllPhotos) -> Void) {
        var request = ApiType.getRandomPhotos.request
        request.url = ApiManager.generateURLComponents(url: request.url?.absoluteString,
                                                       items: [URLQueryItem(name: "count", value: "\(30)")])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let castResponse = response as? HTTPURLResponse,
                  castResponse.statusCode == 200 else { return }
            let photos = ApiManager.decodeData(decodeType: AllPhotos.self, from: data)
            completion(photos ?? [])
        }
        task.resume()
    }
    
    func getSearchPhoto(search: String?, completion: @escaping (_ photos: AllPhotos)  -> Void) {
        var request = ApiType.getSearchPhotos.request
        request.url = ApiManager.generateURLComponents(url: request.url?.absoluteString,
                                                       items: [URLQueryItem(name: "query", value: search)])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let castResponse = response as? HTTPURLResponse,
                  castResponse.statusCode == 200 else { return }
            let photos = ApiManager.decodeData(decodeType: SearchModel.self, from: data)
            completion(photos?.results ?? [])
        }
        task.resume()
    }
    
    
}
