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
        self.init(resource.key, tableName: resource.table)
    }
}
