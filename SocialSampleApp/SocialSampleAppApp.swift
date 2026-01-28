//
//  SocialSampleAppApp.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import SwiftUI
import Tolgee

@main
struct SocialSampleAppApp: App {

    init() {
        Tolgee.shared.initialize(cdn: URL(string: "https://cdn.tolg.ee/478eeb6ee60ff83f6865b0d3f4f4651c")!,
                                 namespaces: ["Notifications", "Profile", "Search", "Tweets"])
        Task {
            await Tolgee.shared.remoteFetch()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
