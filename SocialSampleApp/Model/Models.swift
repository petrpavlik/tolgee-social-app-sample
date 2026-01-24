//
//  Models.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    let username: String
    let displayName: String
    let bio: String
    let avatarColor: String
    let followingCount: Int
    let followerCount: Int
    
    init(id: UUID = UUID(), username: String, displayName: String, bio: String, avatarColor: String, followingCount: Int = 0, followerCount: Int = 0) {
        self.id = id
        self.username = username
        self.displayName = displayName
        self.bio = bio
        self.avatarColor = avatarColor
        self.followingCount = followingCount
        self.followerCount = followerCount
    }
}

struct Tweet: Identifiable {
    let id: UUID
    let author: User
    let content: String
    let timestamp: Date
    var likes: Int
    var retweets: Int
    var replies: Int
    var isLiked: Bool
    var isRetweeted: Bool
    
    init(id: UUID = UUID(), author: User, content: String, timestamp: Date, likes: Int = 0, retweets: Int = 0, replies: Int = 0, isLiked: Bool = false, isRetweeted: Bool = false) {
        self.id = id
        self.author = author
        self.content = content
        self.timestamp = timestamp
        self.likes = likes
        self.retweets = retweets
        self.replies = replies
        self.isLiked = isLiked
        self.isRetweeted = isRetweeted
    }
}
