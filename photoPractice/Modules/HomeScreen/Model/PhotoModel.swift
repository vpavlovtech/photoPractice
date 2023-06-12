//
//  PhotoModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

struct PhotoModel: Codable {
    let id, slug: String?
        let createdAt, updatedAt, promotedAt: Date?
        let width, height: Int?
        let color, blurHash: String?
        let description: String?
        let altDescription: String?
        let urls: Urls?
        let links: GETSubscriptionsModelLinks?
        let likes: Int?
        let likedByUser: Bool?
        let currentUserCollections: [String]?
        let sponsorship: String?
        let topicSubmissions: GETSubscriptionsModelTopicSubmissions?
        let user: User?
        let exif: Exif?
        let location: Location?
        let meta: Meta?
        let publicDomain: Bool?
        let tags: [Tag]?
        let tagsPreview: [TagsPreview]?
        let views, downloads: Int?
        let topics: [String]?

        enum CodingKeys: String, CodingKey {
            case id, slug
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case promotedAt = "promoted_at"
            case width, height, color
            case blurHash = "blur_hash"
            case description
            case altDescription = "alt_description"
            case urls, links, likes
            case likedByUser = "liked_by_user"
            case currentUserCollections = "current_user_collections"
            case sponsorship
            case topicSubmissions = "topic_submissions"
            case user, exif, location, meta
            case publicDomain = "public_domain"
            case tags
            case tagsPreview = "tags_preview"
            case views, downloads, topics
        }
    }

    // MARK: - Exif
    struct Exif: Codable {
        let make, model, name, exposureTime: String?
        let aperture, focalLength, iso: String?

        enum CodingKeys: String, CodingKey {
            case make, model, name
            case exposureTime = "exposure_time"
            case aperture
            case focalLength = "focal_length"
            case iso
        }
    }

    // MARK: - GETSubscriptionsModelLinks
    struct GETSubscriptionsModelLinks: Codable {
        let linksSelf, html, download, downloadLocation: String?

        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case html, download
            case downloadLocation = "download_location"
        }
    }

    // MARK: - Location
    struct Location: Codable {
        let name, city, country: String?
        let position: Position?
    }

    // MARK: - Position
    struct Position: Codable {
        let latitude, longitude: Int?
    }

    // MARK: - Meta
    struct Meta: Codable {
        let index: Bool?
    }

    // MARK: - Tag
    struct Tag: Codable {
        let type: TypeEnum?
        let title: String?
        let source: Source?
    }

    // MARK: - Source
    struct Source: Codable {
        let ancestry: Ancestry?
        let title, subtitle, description, metaTitle: String?
        let metaDescription: String?
        let coverPhoto: CoverPhoto?

        enum CodingKeys: String, CodingKey {
            case ancestry, title, subtitle, description
            case metaTitle = "meta_title"
            case metaDescription = "meta_description"
            case coverPhoto = "cover_photo"
        }
    }

    // MARK: - Ancestry
    struct Ancestry: Codable {
        let type, category, subcategory: Category?
    }

    // MARK: - Category
    struct Category: Codable {
        let slug, prettySlug: String?

        enum CodingKeys: String, CodingKey {
            case slug
            case prettySlug = "pretty_slug"
        }
    }

    // MARK: - CoverPhoto
    struct CoverPhoto: Codable {
        let id, slug: String?
        let createdAt, updatedAt, promotedAt: Date?
        let width, height: Int?
        let color, blurHash, description, altDescription: String?
        let urls: Urls?
        let links: GETSubscriptionsModelLinks?
        let likes: Int?
        let likedByUser: Bool?
        let currentUserCollections: [String]?
        let sponsorship: String?
        let topicSubmissions: CoverPhotoTopicSubmissions?
        let premium, plus: Bool?
        let user: User?

        enum CodingKeys: String, CodingKey {
            case id, slug
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case promotedAt = "promoted_at"
            case width, height, color
            case blurHash = "blur_hash"
            case description
            case altDescription = "alt_description"
            case urls, links, likes
            case likedByUser = "liked_by_user"
            case currentUserCollections = "current_user_collections"
            case sponsorship
            case topicSubmissions = "topic_submissions"
            case premium, plus, user
        }
    }

    // MARK: - CoverPhotoTopicSubmissions
    struct CoverPhotoTopicSubmissions: Codable {
        let currentEvents, animals: Animals?

        enum CodingKeys: String, CodingKey {
            case currentEvents = "current-events"
            case animals
        }
    }

    // MARK: - Animals
    struct Animals: Codable {
        let status: String?
        let approvedOn: Date?

        enum CodingKeys: String, CodingKey {
            case status
            case approvedOn = "approved_on"
        }
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
        let updatedAt: Date?
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

    enum TypeEnum: String, Codable {
        case landingPage = "landing_page"
        case search = "search"
    }

    // MARK: - TagsPreview
    struct TagsPreview: Codable {
        let type: TypeEnum?
        let title: String?
    }

    // MARK: - GETSubscriptionsModelTopicSubmissions
    struct GETSubscriptionsModelTopicSubmissions: Codable {
    }

typealias AllPhotos = [PhotoModel]
