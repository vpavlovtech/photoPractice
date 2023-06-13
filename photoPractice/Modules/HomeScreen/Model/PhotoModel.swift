//
//  PhotoModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

struct PhotoModel: Codable {
    let id: String?
    let createdAt: String?
    let urls: Urls?
    let likes: Int?
    let likedByUser: Bool?
    let user: User?
    let location: Location?
    let views, downloads: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case urls, likes
        case likedByUser = "liked_by_user"
        case user,location
        case views, downloads
    }
}

// MARK: - Location
struct Location: Codable {
    let name, city, country: String?
    let position: Position?
}
// MARK: - Position
struct Position: Codable {
    let latitude, longitude: Double?
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?
    
    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
    let paypalEmail: String?
    
    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }
}

typealias AllPhotos = [PhotoModel]
