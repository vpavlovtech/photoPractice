//
//  String + ext.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

extension String {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = .current
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd MMMM YYYY"
        return dateFormatter.string(from: date ?? .now)
    }
}
