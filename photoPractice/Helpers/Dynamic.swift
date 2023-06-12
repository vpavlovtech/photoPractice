//
//  Dynamic.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    init(value: T) {
        self.value = value
    }
}
