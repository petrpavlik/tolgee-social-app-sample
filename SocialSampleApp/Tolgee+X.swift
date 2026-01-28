//
//  Tolgee+X.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import Tolgee
import SwiftUI

extension TolgeeText {
    init(_ resource: LocalizedStringResource) {

        let bundle: Bundle
        switch resource.bundle {
        case .main:
            bundle = .main
        case .forClass(let className):
            bundle = .init(for: className)
        case .atURL(let url):
            bundle = .init(url: url) ?? .main
        @unknown default:
            bundle = .main
        }

        self.init(resource.key, tableName: resource.table, bundle: bundle)
    }
}
