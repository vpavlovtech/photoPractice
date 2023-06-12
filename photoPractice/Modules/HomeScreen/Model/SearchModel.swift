//
//  SearchModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let total, totalPages: Int?
    let results: AllPhotos?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}
