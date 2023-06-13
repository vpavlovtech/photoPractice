//
//  UserDefaultsWorker.swift
//  photoPractice
//
//  Created by VPDev on 13.06.2023.
//

import Foundation

final class UserDefaultsWorker {
    static let shared = UserDefaultsWorker()
    private let userDefaults = UserDefaults.standard
    private var photos: AllPhotos = []
    private init() {}
    private static let SAVED_PHOTO = "saved_photo"
    
    func savePhoto(photo: PhotoModel?) {
        guard let photo = photo else { return }
        do {
            photos = getPhotos()
            photos.append(photo)
            let encodedData = try JSONEncoder().encode(photos)
            userDefaults.set(encodedData, forKey: UserDefaultsWorker.SAVED_PHOTO)
            
        } catch {
            print("Error save photo")
        }
    }
    func getPhotos() -> AllPhotos {
        var photos: AllPhotos = []
        if let savedData = userDefaults.object(forKey: UserDefaultsWorker.SAVED_PHOTO) as? Data {
            do{
                let savedPhotos = try JSONDecoder().decode(AllPhotos.self, from: savedData)
                photos = savedPhotos
            } catch {
                print("Error get photos")
            }
        }
        return photos
    }
    func removePhoto(photo: PhotoModel?) -> AllPhotos {
        guard let photo = photo else { return [] }
        var photos: AllPhotos = []
        
        if let savedData = userDefaults.object(forKey: UserDefaultsWorker.SAVED_PHOTO) as? Data {
            do{
                let savedPhotos = try JSONDecoder().decode(AllPhotos.self, from: savedData)
                savedPhotos.forEach {
                    if $0.id != photo.id {
                        photos.append($0)
                    }
                }
            } catch {
                print("Error remove photos")
            }
        }
        return photos
    }
    
}
